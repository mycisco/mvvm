//
//  TransitionModel.swift
//  mvvm
//
//  Created by marbean on 2020/07/13.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TranisitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
