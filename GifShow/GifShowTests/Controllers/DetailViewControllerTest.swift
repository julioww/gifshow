//
//  DetailViewControllerTest.swift
//  GifShowTests
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import XCTest
@testable import GifShow

class DetailViewControllerTest: XCTestCase {
    
    var viewController: DetailViewController!
    
    override func setUp() {
        super.setUp()
        viewController = (DetailBuilder(urlImage: "test").main() as! DetailViewController)
        UIApplication.shared.keyWindow!.rootViewController = viewController
    }
    
    func testLoadViews() {
        XCTAssertNotNil(viewController.view)
    }
}
