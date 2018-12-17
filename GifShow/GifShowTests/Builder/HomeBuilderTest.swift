//
//  HomeBuilderTest.swift
//  GifShowTests
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import XCTest
@testable import GifShow

class HomeBuilderTest: XCTestCase {
    
    var builder: AppBuilder!
    var viewController: UIViewController!
    
    override func setUp() {
        super.setUp()
        builder = HomeBuilder()
        viewController = builder.main()
    }
    
    func testViewControllerType() {
        XCTAssert(viewController is HomeCollectionViewController)
    }
    
}
