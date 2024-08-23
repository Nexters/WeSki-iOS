//
//  NetworkManager.swift
//  WeSki
//
//  Created by kokojong on 8/20/24.
//

import Foundation
import Alamofire

final class NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    func request<T: Decodable>(type: T.Type, api: Router) async throws -> T {

        let dataTask = try AF.request(api.asURLRequest()).serializingDecodable(type)
        await print(String(data: dataTask.response.data!, encoding: .utf8))

        switch await dataTask.result {
        case .success(let result):
            guard let response = await dataTask.response.response else {
                throw RequestError.unknown
            }
            print("result", result)
            return result
        case .failure(let error):
            print("error", error)
            throw error
        }
    }

    func request(api: Router) async throws {
        let req = try AF.request(api.asURLRequest())
        print(req.response?.statusCode)
        req.response { data in // response가 nil이라서 필요가 없음..
            print("request data", data)
        }
    }

}

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown

    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
