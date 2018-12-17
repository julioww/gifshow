//
//  DetailViewController.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    
    fileprivate var downloadTask: URLSessionDataTask?
    var viewModel: DetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView(urlString: viewModel.imageUrl)
    }
    
    func setUpView (urlString : String) {
        downloadTask = detailImage.downloadImageFromUrl(urlString, completionHandler: { (data) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.detailImage.animate(withGIFData: data)
            }
        })
    }
    func dismissViewController() {
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
        self.dismiss(animated: true, completion: nil)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissViewController()
    }
}
