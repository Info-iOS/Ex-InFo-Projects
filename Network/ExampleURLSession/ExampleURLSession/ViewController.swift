import UIKit

struct MealItem: Codable {
    let riceType: String
    let item: String
    let riceId: Int
}

struct MealResponse: Codable {
    let responseList: [MealItem]
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let headers = [
            "Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqdW5oYSIsInR5cGUiOiJhY2Nlc3MiLCJpYXQiOjE2ODU0MjIxMjksImV4cCI6MTY4NTQyMzkyOX0.l9B6DRPpyyzd1DcmIVQBqEAutypSYSoXG2lf6DAfUZM"
        ]
        
        guard let url = URL(string: "http://www.mukgen.info/meal/today") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Network request failed: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let mealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
                
                for item in mealResponse.responseList {
                    print("Rice Type: \(item.riceType)")
                    print("Item: \(item.item)")
                    print("Rice ID: \(item.riceId)")
                    print("--------------------")
                }
            } catch {
                print("Decoding failed: \(error)")
            }
        }
        
        task.resume()
    }
}
