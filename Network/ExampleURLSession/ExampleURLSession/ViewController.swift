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
            "Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqdW5oYSIsInR5cGUiOiJhY2Nlc3MiLCJpYXQiOjE2ODU0NDAzMDEsImV4cCI6MTY4NTQ0MjEwMX0.KUMeXE8LEAa8zk6RZMSqFadLLcTqWfK-o2at-zmPHnM"
        ]
        
        // URL 생성
        guard let url = URL(string: "http://www.mukgen.info/meal/today") else {
            print("Invalid URL")
            return
        }
        
        // URLRequest 생성
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        // URLSession을 사용하여 데이터 요청 및 응답 처리
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("😵 요청 실패 😵: \(error)")
                return
            }
            
            // 데이터 수신 확인
            guard let data = data else {
                print("🫠 수신된 데이터가 없습니다 🫠")
                return
            }
            
            do {
                // JSON 데이터 디코딩
                let mealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
                
                // 디코딩된 데이터 출력
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
