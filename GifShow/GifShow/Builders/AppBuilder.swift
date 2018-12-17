//
//  AppBuilder.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import UIKit

protocol AppBuilder {
    var networkService: NetworkServiceProtocol! { get }
    
    func main() -> UIViewController
}

extension AppBuilder {
    internal var networkService: NetworkServiceProtocol {
        return NetworkService()
    }
}
