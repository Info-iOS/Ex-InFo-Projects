//
//  MealAPI.swift
//  ExampleMoya
//
//  Created by 박준하 on 2023/05/30.
//

import Moya
import Foundation

struct MealItem: Codable {
    let riceType: String
    let item: String
    let riceId: Int
}

struct MealResponse: Codable {
    let responseList: [MealItem]
}

enum MealAPI {
    case today
}

extension MealAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://www.mukgen.info")!
    }
    
    var path: String {
        return "/meal/today"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String: String]? {
        return [
            "Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqdW5oYSIsInR5cGUiOiJhY2Nlc3MiLCJpYXQiOjE2ODU0NDAzMDEsImV4cCI6MTY4NTQ0MjEwMX0.KUMeXE8LEAa8zk6RZMSqFadLLcTqWfK-o2at-zmPHnM"
        ]
    }
}
