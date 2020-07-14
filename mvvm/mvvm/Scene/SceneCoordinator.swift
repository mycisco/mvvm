//
//  SceneCoordinator.swift
//  mvvm
//
//  Created by marbean on 2020/07/13.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SceneCoordinator: SceneCoordinatorType {
    
    private let bag = DisposeBag()
    private var window: UIWindow
    private var currnetVC: UIViewController
    
    required init(window: UIWindow) {
        self.window = window
        currnetVC = window.rootViewController!
    }
    
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animatied: Bool) -> Completable {
        
        let subject = PublishSubject<Void>()
        let target = scene.viewController()
        
        switch style {
        case .root:
            currnetVC = target
            window.rootViewController = target
            subject.onCompleted()
            break
        case .push:
            guard let nav = currnetVC.navigationController else {
                subject.onError(TranisitionError.navigationControllerMissing)
                break
            }
            
            nav.pushViewController(target, animated: animatied)
            currnetVC = target
            subject.onCompleted()
        break
            
        case .modal:
            currnetVC.present(target, animated: animatied) {
                subject.onCompleted()
            }
            
            currnetVC = target
            break
        }
        
        return subject.ignoreElements()
    }
    
    @discardableResult
    func close(animation: Bool) -> Completable {
        return Completable.create { [unowned self] compleable in
            
            if let presentingVC = self.currnetVC.presentingViewController {
                self.currnetVC.dismiss(animated: animation) {
                    self.currnetVC = presentingVC
                    compleable(.completed)
                }
            } else if let navi = self.currnetVC.navigationController {
                
            }
            
            
        }
    }
}
