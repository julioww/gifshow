//
//  HomeViewModel.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel: HomeViewModelProtocol {
    private var interactor: HomeInteractorProtocol!
    
    let dataSource = Variable<[Gif]>([])
    
    required init(with interactor: HomeInteractorProtocol) {
        self.interactor = interactor
    }

}


