//
//  JSONModel.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JSONModel {
    
    var json: JSON? { get set }
    
    init()
}

extension JSONModel {
    
    init?(json: JSON?) {
        guard let json = json,
            json.isEmpty == false,
            json.type != .null else {
                return nil
        }
        
        self.init()
        self.json = json
    }
}
