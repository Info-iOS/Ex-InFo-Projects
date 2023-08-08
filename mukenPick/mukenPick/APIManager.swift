//
//  APIManager.swift
//  mukenPick
//
//  Created by 박준하 on 2023/08/08.
//

import Foundation
import UIKit

class APIManager {
    let baseURL = "https://www.mukgen.info"
    let endpoint = "/mukgen-pick"
    let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJnb29kanVuaGEiLCJpYXQiOjE2OTE0NzkzMDUsImV4cCI6MTY5MTQ4MTEwNX0.q83_J4P7IoqdWc8nyzAULrVFIdNw7qXj8bjL8oo3ic4"

    func fetchRiceMenu(completion: @escaping (RiceMenu?) -> Void) {
        let url = URL(string: baseURL + endpoint)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
            } else if let data = data {
                let decoder = JSONDecoder()

                do {
                    let riceMenu = try decoder.decode(RiceMenu.self, from: data)
                    completion(riceMenu)
                } catch {
                    print("Error: \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }.resume()
    }
}
