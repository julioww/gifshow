//
//  APIEndPoint.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import Alamofire

enum APIEndPoint {
    case fetchTrendingGifs(page: Int, max: Int)
}

extension APIEndPoint {
    
    var url: String {
        switch self {
        case .fetchTrendingGifs(_, _):
            return "\(API.baseURLString)\(API.trendingPath)?api_key=\(API.key)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchTrendingGifs(_, _):
            return .get
        }
    }
    
    var params: [String: Any] {
        switch self {
        case .fetchTrendingGifs(let page, let max):
            return [
                "rating":"G",
                "limit": max,
                "offset": page*max
            ]
        }
    }
}
