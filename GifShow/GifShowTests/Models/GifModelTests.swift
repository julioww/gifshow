//
//  GifModelTests.swift
//  GifShowTests
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import XCTest
import SwiftyJSON
@testable import GifShow

class GifModelTests: XCTestCase {
    
    //TODO: Move to a helper class and update the other thats to use that
    func getJsonFromFile(resource: String, ext: String) -> JSON? {
        let bundle = Bundle(for: type(of: self))
        guard let file = bundle.url(forResource: resource, withExtension: ext),
            let data = try? Data(contentsOf: file) else {
                return nil
        }
        let json = try? JSON(data: data)
        return json
    }
    
    func testGifResult() {
        let json = getJsonFromFile(resource: "first_result", ext: "json")
        let itemsPerpage = json!["pagination"]["count"]
        var mocks:[Gif] = []
        for item in json!["data"].arrayValue {
            mocks.append(Gif(json: item))
        }
        
        XCTAssertEqual(mocks.count, itemsPerpage.intValue)
    }
    func testGif() {
        let json = getJsonFromFile(resource: "first_result", ext: "json")
        let gif = Gif(json: json!["data"].arrayValue.first!)
        
        XCTAssertEqual(gif.urlPreview, "https://media0.giphy.com/media/wsVRNyv9yo18LkW5Y9/giphy-preview.gif")
        XCTAssertEqual(gif.urlOriginal, "https://media0.giphy.com/media/wsVRNyv9yo18LkW5Y9/giphy.gif")
    }
}
