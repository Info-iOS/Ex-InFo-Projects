//
//  ViewController.swift
//  ExampleMoya
//
//  Created by 박준하 on 2023/05/30.
//

import UIKit
import Moya

struct MealResponse: Codable {
    let item: String
    let riceId: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let provider = MoyaProvider<MealAPI>()

        provider.request(.getMeal(riceType: "BREAKFAST,LUNCH,DINNER", year: 2023, month: 5, day: 30)) { result in
            switch result {
            case let .success(response):
                do {
                    let decoder = JSONDecoder()
                    let mealResponse = try decoder.decode(MealResponse.self, from: response.data)
                    print("Item: \(mealResponse.item)")
                    print("Rice ID: \(mealResponse.riceId)")
                } catch {
                    print("Error decoding response: \(error)")
                }
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}

