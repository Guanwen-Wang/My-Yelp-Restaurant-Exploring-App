//
//  NetworkService.swift
//  ece564-proj
//
//  Created by Guanwen Wang on 11/14/19.
//  Copyright © 2019 Duke University. All rights reserved.
//

import Foundation
import Moya

let REQUEST_LIMIT = 50

private let apiKey = "" /* paste yout yelp api key here */

enum YelpService {
    enum BusinessesProvider: TargetType {
        case search(lat: Double, long: Double)
        case details(id: String)
        
        var baseURL: URL {
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }

        var path: String {
            switch self {
            case .search:
                return "/search"
            case let .details(id):
                return "/\(id)"
            }
        }

        var method: Moya.Method {
            return .get
        }

        var sampleData: Data {
            return Data()
        }

        var task: Task {
            switch self {
            case let .search(lat, long):
                return .requestParameters(
                    parameters: ["latitude": lat, "longitude": long, "limit": REQUEST_LIMIT ], encoding: URLEncoding.queryString)
            case .details:
                return .requestPlain
            }
             
        }

        var headers: [String : String]? {
            return ["Authorization": "Bearer \(apiKey)"]
        }
    }
    
    enum EventsProvider: TargetType {
        case search(lat: Double, long: Double)
        case details(id: String)
        
        var baseURL: URL {
            return URL(string: "https://api.yelp.com/v3/events")!
        }

        var path: String {
            switch self {
            case .search:
                return ""
            case let .details(id):
                return "/\(id)"
            }
        }

        var method: Moya.Method {
            return .get
        }

        var sampleData: Data {
            return Data()
        }

        var task: Task {
            switch self {
            case let .search(lat, long):
                return .requestParameters(
                    parameters: ["latitude": lat, "longitude": long, "limit": 15 ], encoding: URLEncoding.queryString)
            case .details:
                return .requestPlain
            }
             
        }

        var headers: [String : String]? {
            return ["Authorization": "Bearer \(apiKey)"]
        }
    }
}
