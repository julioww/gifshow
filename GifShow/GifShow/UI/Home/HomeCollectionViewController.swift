//
//  HomeCollectionViewController.swift
//  GifShow
//
//  Created by Julio Cezar Freitas de Abreu on 17.12.18.
//  Copyright © 2018 Julio Cezar Freitas de Abreu. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeCollectionViewController: UICollectionViewController {
    
    let reusableCell = "GifCell"
    var itemsPerRow: CGFloat = 4
    var viewModel: HomeViewModelProtocol!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = nil
        self.collectionView.setContentOffset(collectionView.contentOffset, animated: false)
        setupCollectionViewBinding()
        setupNextPageLoader()
    }
    
    //MARK:Binds
    
    private func setupCollectionViewBinding() {
        self.viewModel.dataSource.asObservable().bind(to: self.collectionView.rx.items(cellIdentifier: reusableCell, cellType: HomeCollectionViewCell.self)) { row, data, cell in
            cell.setUpCell(urlString: data.urlPreview!)
            }.disposed(by: disposeBag)
    }
    
    private func setupNextPageLoader() {
        let loadNextPageTrigger = collectionView.rx.contentOffset
            .flatMap({ [weak self] offset -> Observable<CGPoint> in
                self!.isNearTheBottomEdge(contentOffset: offset, self!.collectionView)
                    ? Observable.just(offset)
                    : Observable.empty()
            })
        
        loadNextPageTrigger.distinctUntilChanged().bind(to: viewModel.nextPage).disposed(by: disposeBag)
    }
    

    //MARK: Helper
    
    private func isNearTheBottomEdge(contentOffset: CGPoint, _ collectionView: UICollectionView) -> Bool {
        return contentOffset.y + (collectionView.frame.size.height * 2) > collectionView.contentSize.height
    }
}
