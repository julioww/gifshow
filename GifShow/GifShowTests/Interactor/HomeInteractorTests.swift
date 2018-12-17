import XCTest
import SwiftyJSON
import RxTest
import RxSwift
import RxBlocking
@testable import GifShow

class HomeInteractorTests: XCTestCase {
    
    var networkService: NetworkServiceProtocol!
    var interactor: HomeInteractorProtocol!
    
    //TODO: Change it for a JSON File
    let gifsMock = [Gif(json: JSON("")),
                    Gif(json: JSON("")),
                    Gif(json: JSON("")),
                    Gif(json: JSON(""))]
    
    override func setUp() {
        self.networkService = NetworkServiceStub(mock: gifsMock)
        self.interactor = HomeInteractor(with: networkService)
    }
    
    func testGetGifs() {
        
        let response = interactor.getGifs(page: 0, limit: 4).toBlocking().materialize()
        switch response {
        case .completed(let elements):
            guard let gifsResponse = elements.first else {
                XCTFail("Expected result to complete with elements, but received 0.")
                return
            }
            XCTAssertEqual(gifsResponse, gifsMock)
        case .failed(_, let error):
            XCTFail("Expected result to complete without error, but received \(error).")
        }
    }
}
