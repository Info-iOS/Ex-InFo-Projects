import UIKit
import Alamofire

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

        let headers: HTTPHeaders = [
            "Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqdW5oYSIsInR5cGUiOiJhY2Nlc3MiLCJpYXQiOjE2ODU0MjIxMjksImV4cCI6MTY4NTQyMzkyOX0.l9B6DRPpyyzd1DcmIVQBqEAutypSYSoXG2lf6DAfUZM"
        ]

        // url 지정 및 메소드 랑 받는 곳
        AF.request("http://www.mukgen.info/meal/today", method: .get, headers: headers)
            .responseDecodable(of: MealResponse.self) { response in
                switch response.result {
                case let .success(mealResponse):
                    // 성공했을 경우
                    for item in mealResponse.responseList {
                        //급식 리스트 출력
                        print("Rice Type: \(item.riceType)")
                        print("Item: \(item.item)")
                        print("Rice ID: \(item.riceId)")
                        print("--------------------")
                    }
                case let .failure(error):
                    // 실패했을 경우
                    print("Network request failed: \(error)")
                }
            }
    }
}
