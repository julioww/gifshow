//
//  JSONModelTests.swift
//  GifShowTests
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import XCTest
import SwiftyJSON

@testable import GifShow

class JSONModelTests: XCTestCase {
    
    func testJsonNil() {
        let gif = Gif(json: nil)
        XCTAssertNil(gif.json)
    }
    func testJsonNotBeingNil() {
        let gif = Gif(json: JSON(""))
        XCTAssertNotNil(gif.json)
    }
}
