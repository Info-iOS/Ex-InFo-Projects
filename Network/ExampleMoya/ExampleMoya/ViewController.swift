import UIKit
import Moya

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let provider = MoyaProvider<MealAPI>()
        
        provider.request(.today) { (result) in
            switch result {
            case let .success(response):
                do {
                    let mealResponse = try response.map(MealResponse.self)
                    
                    for item in mealResponse.responseList {
                        print("Rice Type: \(item.riceType)")
                        print("Item: \(item.item)")
                        print("Rice ID: \(item.riceId)")
                        print("--------------------")
                    }
                } catch {
                    print("Decoding failed: \(error)")
                }
            case let .failure(error):
                print("Network request failed: \(error)")
            }
        }
    }
}
