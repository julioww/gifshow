//
//  HomeCollectionViewCell.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import UIKit
import Gifu

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gifuImage : UIImageView!
    @IBOutlet weak var activityIndicator : UIActivityIndicatorView!
    
    fileprivate var downloadTask: URLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setOpaqueBackground()
    }
    
    func setUpCell (urlString : String) {
        downloadTask = gifuImage.downloadImageFromUrl(urlString, completionHandler: { (data) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.gifuImage.animate(withGIFData: data)
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        })
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        downloadTask?.cancel()
        resetViewCell()
        gifuImage.prepareForReuse()
    }
    
    func resetViewCell() {
        gifuImage.image = nil
        self.activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
}

private extension HomeCollectionViewCell {
    static let defaultBackgroundColor = UIColor.groupTableViewBackground
    
    //Opaque = less processing
    func setOpaqueBackground() {
        alpha = 1.0
        backgroundColor = HomeCollectionViewCell.defaultBackgroundColor
        gifuImage.alpha = 1.0
        gifuImage.backgroundColor = HomeCollectionViewCell.defaultBackgroundColor
    }
}
