//
//  HomeCollectionViewControllerTest.swift
//  GifShowTests
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import XCTest
@testable import GifShow

class HomeCollectionViewControllerTest: XCTestCase {
    
    var viewController: HomeCollectionViewController!
    
    override func setUp() {
        super.setUp()
        viewController = (HomeBuilder().main() as! HomeCollectionViewController)
        UIApplication.shared.keyWindow!.rootViewController = viewController
    }
    
    func testLoadViews() {
        XCTAssertNotNil(viewController.view)
        XCTAssertNotNil(viewController.collectionView)
    }
    
    func test_viewDidLoad_withNoGifs_rendersZeroGifs() {
        //TODO: Finish this test
        XCTAssertEqual(viewController.collectionView.numberOfItems(inSection: 0),0)
    }
    
}
