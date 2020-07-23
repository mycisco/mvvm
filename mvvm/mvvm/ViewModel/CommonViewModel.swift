//
//  CommonViewModel.swift
//  mvvm
//
//  Created by marbean on 2020/07/23.
//

import Foundation
import RxSwift
import RxCocoa

class CommonViewModel: NSObject {
    let titile: Driver<String>
    let sceneCoordinator: SceneCoordinatorType
    let storage: MemoStroageType
    
    init(title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStroageType) {
        
        self.titile = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.sceneCoordinator = sceneCoordinator
        self.storage = storage
    }
}
