import UIKit
import Moya
import RxMoya
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()

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
        
        let authService = AuthService()
        authService.sendCode(email: "jnxhx@dsm.hs.kr")
            .subscribe(onSuccess: {
                print("Code sent successfully")
            }, onError: { error in
                print("Error sending code: \(error)")
            })
            .disposed(by: disposeBag)
    }
}
