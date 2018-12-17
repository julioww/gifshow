//
//  HomeViewModelProtocol.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol HomeViewModelProtocol {
    var dataSource: Variable<[Gif]> { get }
    
    init (with interactor: HomeInteractorProtocol)
}
