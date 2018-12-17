//
//  DetailBuilder.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import UIKit

class DetailBuilder: AppBuilder {
    internal var networkService: NetworkServiceProtocol!
    
    private let viewIdentifier = "DetailView"
    private var urlImage = ""
    init(urlImage: String) {
        self.urlImage = urlImage
    }
    func main() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailView") as! DetailViewController
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .crossDissolve
        
        let viewModel = DetailViewModel()
        viewModel.imageUrl = urlImage
        
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    
}

