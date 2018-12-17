//
//  HomeInteractor.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import RxSwift

class HomeInteractor: HomeInteractorProtocol {
    var networkService: NetworkServiceProtocol!
    
    required init(with service: NetworkServiceProtocol) {
        self.networkService = service
    }
    
    func getGifs(page: Int, limit: Int) -> Observable<[Gif]> {
        
        let obsevable: Observable<[Gif]> =  self.networkService.requestEndpoint(endpoint: .fetchTrendingGifs(page: page, max: limit), objectType: Gif.self)
        return obsevable
    }
}
