//
//  Gif+Test.swift
//  GifShowTests
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
@testable import GifShow

extension Gif: Equatable {
    public static func == (lhs: Gif, rhs: Gif) -> Bool {
        return lhs.json == rhs.json
    }
}
