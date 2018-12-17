//
//  UIImageView+CancellableTask.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func downloadImageFromUrl(_ url: String, completionHandler: @escaping (Data?) -> Void) -> URLSessionDataTask? {
        guard let url = URL(string: url)
            else {
                completionHandler(nil)
                return nil
        }
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            guard let httpURLResponse = response as? HTTPURLResponse , httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data , error == nil
                else {
                    completionHandler(nil)
                    return
            }
            completionHandler(data)
        })
        task.resume()
        return task
    }
}
