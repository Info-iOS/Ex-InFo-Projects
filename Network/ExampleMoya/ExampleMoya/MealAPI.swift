//
//  MealAPI.swift
//  ExampleMoya
//
//  Created by 박준하 on 2023/05/30.
//

import Moya
import Foundation

enum MealAPI {
    case getMeal(riceType: String, year: Int, month: Int, day: Int)
}

extension MealAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://mukgen.info")!
    }
    
    var path: String {
        return "/meal/today/meal"
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .getMeal(riceType, year, month, day):
            let parameters: [String: Any] = [
                "riceType": riceType,
                "year": year,
                "month": month,
                "day": day
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Authorization": "Bearer YOUR_TOKEN"]
    }
}
