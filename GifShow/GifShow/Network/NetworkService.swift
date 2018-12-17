//
//  NetworkService.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import SwiftyJSON

protocol NetworkServiceProtocol {
    func requestEndpoint<T, OUT>(endpoint: APIEndPoint, objectType: T.Type) -> Observable<OUT> where T: JSONModel
}

class NetworkService: NetworkServiceProtocol {
    let dispatchQueue = DispatchQueue(label: "queue.request.parser")
    
    func requestEndpoint<T, OUT>(endpoint: APIEndPoint, objectType: T.Type) -> Observable<OUT> where T : JSONModel {
        
        return Observable<OUT>.create { (observer) -> Disposable in
            
            let requestReference = Alamofire.request(endpoint.url, method: endpoint.method, parameters: endpoint.params)
                .validate()
                .responseJSON(completionHandler: { (response) in
                    
                    switch response.result {
                    case .success(let value):
                        if OUT.self is [T].Type  {
                            let json = JSON(value)["data"].arrayValue
                            let result = json.map { T(json: $0) } as! OUT
                            observer.onNext(result)
                        } else {
                            let result = objectType.init(json: JSON(value)) as! OUT
                            observer.onNext(result)
                        }
                        break;
                        
                    case .failure(let error):
                        observer.onError(error)
                        break;
                    }
                    observer.onCompleted()
                })
            
            return Disposables.create(with: {
                requestReference.cancel()
            })
        }
    }
}
