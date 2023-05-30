//
//  ViewController.swift
//  exampleAlamofire
//
//  Created by 박준하 on 2023/05/30.
//

import UIKit
import Alamofire

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
        // Do any additional setup after loading the view.
        let mealRequest = MealRequest(riceType: "BREAKFAST,LUNCH,DINNER", year: 2023, month: 5, day: 30)

        AF.request("http://mukgen.info/meal/today/meal", method: .post, parameters: mealRequest, encoder: JSONParameterEncoder.default, headers: ["Authorization": "Bearer YOUR_TOKEN"])
            .responseDecodable(of: MealResponse.self) { response in
                switch response.result {
                case let .success(mealResponse):
                    print("Item: \(mealResponse.item)")
                    print("Rice ID: \(mealResponse.riceId)")
                case let .failure(error):
                    print("Network request failed: \(error)")
                }
            }
    }


}

