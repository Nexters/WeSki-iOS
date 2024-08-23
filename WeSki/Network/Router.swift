//
//  Router.swift
//  WeSki
//
//  Created by kokojong on 8/18/24.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case voteResult(Int)
    case vote(Int, Bool) // key, like
    
    var path: String {
        switch self {
        case .vote(let key, let _):
            return "\(key)/snowmaking"
        case .voteResult(let key):
            return "\(key)/snowmaking"
        }
    }
    
    var url: URL {
        URL(string: Network.baseURL)!
    }
    
    var headers: HTTPHeaders {
        var defaultHeader: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        switch self {
        case .vote:
            return defaultHeader
        case .voteResult:
            return defaultHeader
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .vote:
            return .post
        case .voteResult:
            return .get
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .vote(let key, let isLike):
            return ["isLike": isLike]
        case .voteResult:
            return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = try URLRequest(url: url, method: method, headers: headers)
        
        if method == .post || method == .delete {
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            request.url = components?.url
            
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
        }
        else if method == .get {
            let queryParams = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            request.url = components?.url
        }
        
        debugPrint("❗️ request, headers, body", request, request.headers, request.httpBody)
        
        return request
    }
}

