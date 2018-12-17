//
//  HomeBuilder.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import UIKit

class HomeBuilder: AppBuilder {
    internal var networkService: NetworkServiceProtocol!
    
    func main() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeCollectionView") as! HomeCollectionViewController
        //inject the dependecies
        return viewController
    }
}
