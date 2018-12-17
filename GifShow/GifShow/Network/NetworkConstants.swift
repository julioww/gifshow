//
//  NetworkConstants.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import Alamofire

struct API {
    static let key = "KtRPl7reyq9LZg9xVRy1MkPldG8McjCw"
    static let baseURLString = "https://api.giphy.com"
    static let trendingPath = "/v1/gifs/trending"
}

enum APIError: Error {
    case generic
    case noConnection
}

