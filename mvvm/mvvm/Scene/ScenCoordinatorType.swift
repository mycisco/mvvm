//
//  ScenCoordinatorType.swift
//  mvvm
//
//  Created by marbean on 2020/07/13.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animatied: Bool) -> Completable
    
    @discardableResult
    func close(animation: Bool) -> Completable
}
