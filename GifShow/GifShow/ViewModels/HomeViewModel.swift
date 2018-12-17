//
//  HomeViewModel.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel: HomeViewModelProtocol {
    private var interactor: HomeInteractorProtocol!
    private let disposeBag = DisposeBag()
    
    private var currentPage = 0
    private let limit = 25
    
    let dataSource = Variable<[Gif]>([])
    let nextPage = PublishSubject<CGPoint>()
    
    required init(with interactor: HomeInteractorProtocol) {
        self.interactor = interactor
        fetchData(page: currentPage)
        setNextPageObservable()
    }
    
    private func fetchData (page: Int) {
        interactor.getGifs(page: page, limit: limit).subscribe(onNext: { list in
            self.dataSource.value.append(contentsOf: list)
        }, onError: { error in
            print(error)
        }, onCompleted: {
            print("completed")
        }) {
            print("Disposed")
            }.disposed(by: disposeBag)
    }
    
    private func setNextPageObservable(){
        nextPage.asObserver().subscribe { (_) in
            DispatchQueue.main.async {
                self.currentPage += 1
                self.fetchData(page: self.currentPage)
            }
            }.disposed(by: disposeBag)
    }
}


