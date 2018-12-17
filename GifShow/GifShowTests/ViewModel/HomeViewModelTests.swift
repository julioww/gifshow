//
//  HomeViewModelTests.swift
//  GifShowTests
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON
import XCTest
@testable import GifShow

class HomeViewModelTests: XCTestCase {
    
    var networkService: NetworkServiceProtocol!
    var interactor: HomeInteractorProtocol!
    var viewModel: HomeViewModelProtocol!
    
    //TODO: Replace it for a JSON File
    let gifsMock = [Gif(json: JSON("")),
                    Gif(json: JSON("")),
                    Gif(json: JSON("")),
                    Gif(json: JSON(""))]
    
    override func setUp() {
        self.networkService = NetworkServiceStub(mock: gifsMock)
        self.interactor = HomeInteractor(with: networkService)
        self.viewModel = HomeViewModel(with: interactor)
    }
    
    func testFirstFetch() {
        let itemsLoaded = viewModel.dataSource.value
        
        XCTAssertEqual(itemsLoaded, gifsMock)
    }
    
    func testNextPageFetch() {
        let itemsPerPage = gifsMock.count
        var currentPage = 0
        
        let response = viewModel.dataSource.asObservable().materialize()
        response.subscribe { (event) in
            currentPage += 1
            XCTAssertEqual(event.element?.element?.count, currentPage * itemsPerPage)
            }.dispose()
        
        viewModel.nextPage.onNext(CGPoint.zero)
    }
    
    func testPageTwoFetch() {
        let itemsPerPage = gifsMock.count
        let currentPage = 2
        
        let response = viewModel.dataSource.asObservable().takeLast(1).materialize()
        response.subscribe { (event) in
            XCTAssertEqual(event.element?.element?.count, currentPage * itemsPerPage)
            }.dispose()
        
        viewModel.nextPage.onNext(CGPoint.zero)
    }
}

