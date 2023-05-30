//
//  ViewController.swift
//  ExampleURLSession
//
//  Created by 박준하 on 2023/05/30.
//

import UIKit

// Create a request struct
struct MealRequest: Encodable {
    let riceType: String
    let year: Int
    let month: Int
    let day: Int
}

struct MealResponse: Codable {
    let item: String
    let riceId: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mealRequest = MealRequest(riceType: "BREAKFAST,LUNCH,DINNER", year: 2023, month: 5, day: 30)
        
        do {
            let jsonData = try JSONEncoder().encode(mealRequest)
            
            guard let url = URL(string: "http://mukgen.info/meal/today/meal") else {
                fatalError("Invalid URL")
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer YOUR_TOKEN", forHTTPHeaderField: "Authorization")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Network request failed: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response")
                    return
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    print("HTTP response error: \(httpResponse.statusCode)")
                    return
                }
                
                guard let responseData = data else {
                    print("No response data")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let mealResponse = try decoder.decode(MealResponse.self, from: responseData)
                    print("Item: \(mealResponse.item)")
                    print("Rice ID: \(mealResponse.riceId)")
                } catch {
                    print("Error decoding response: \(error)")
                }
            }
            
            task.resume()
        } catch {
            print("Encoding error: \(error)")
        }
        
    }
}

