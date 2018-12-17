//
//  NetworkServiceStub.swift
//  GifShowTests
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON
import Alamofire
@testable import GifShow

class NetworkServiceStub: NetworkServiceProtocol {
    
    let mock: [JSONModel]
    
    init(mock: [JSONModel]) {
        self.mock = mock
    }
    
    func requestEndpoint<T, OUT>(endpoint: APIEndPoint, objectType: T.Type) -> Observable<OUT>  where T: JSONModel {
        
        let response = mock as! OUT
        return Observable.just(response)
    }
}
