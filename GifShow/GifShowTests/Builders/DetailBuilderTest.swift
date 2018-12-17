//
//  DetailBuilderTest.swift
//  GifShowTests
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import XCTest
@testable import GifShow

class DetailBuilderTest: XCTestCase {
    
    var builder: AppBuilder!
    var viewController: UIViewController!
    var mockUrl = "https://media0.giphy.com/media/3o7TKz6eMNdooOHzG0/200w.gif"
    override func setUp() {
        super.setUp()
        builder = DetailBuilder(urlImage: mockUrl)
        viewController = builder.main()
    }
    
    func testViewControllerType() {
        XCTAssert(viewController is DetailViewController)
    }
}
