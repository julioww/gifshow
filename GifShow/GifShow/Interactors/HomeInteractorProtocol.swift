//
//  HomeInteractorProtocol.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeInteractorProtocol {
    var networkService: NetworkServiceProtocol! { get }
    init (with service: NetworkServiceProtocol)
    
    func getGifs(page: Int, limit: Int) -> Observable<[Gif]>
}
