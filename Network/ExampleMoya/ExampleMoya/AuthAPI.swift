//
//  AuthAPI.swift
//  ExampleMoya
//
//  Created by 박준하 on 2023/06/07.
//

import Foundation
import Moya
import RxMoya
import RxSwift

public enum AuthAPI {
    case login(email: String, password: String)
    case sandCode(email: String)
    case checkCode(email: String, data: String, type: String)
    case reissue
    case tokenTime(token: String)
}

extension AuthAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.info-dsm.info")!
    }
    
    public var path: String {
        switch self {
        case .login:
            return "/auth/login/user"
        case .sandCode:
            return "/auth/code"
        case .checkCode:
            return "/auth/code"
        case .reissue:
            return "/auth/reissue"
        case .tokenTime:
            return "/auth/token"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .sandCode:
            return .put
        case .checkCode:
            return .post
        case .reissue:
            return .put
        case .tokenTime:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case let .login(email, password):
            let parameters = ["email": email, "password": password]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case let .sandCode(email):
            let parameters = ["email": email]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case let .checkCode(email, data, type):
            let parameters = ["email": email, "data": data, "type": type]
             return .requestJSONEncodable(parameters)
        case .reissue:
             return .requestPlain
        case .tokenTime(let token):
            let parameters: [String : Any] = ["token": token]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
