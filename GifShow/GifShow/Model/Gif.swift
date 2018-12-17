//
//  Gif.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Gif: JSONModel {
    
    var json: JSON?
    
    var id: String {
        return json?["id"].stringValue ?? ""
    }
    var urlOriginal: String? {
        return json?["images"]["original"]["url"].stringValue
    }
    var urlPreview: String? {
        return json?["images"]["preview_gif"]["url"].stringValue
    }
}
