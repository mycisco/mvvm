//
//  Scene.swift
//  mvvm
//
//  Created by marbean on 2020/07/13.
//

import UIKit

enum Scene {
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}

extension Scene {
    func viewController() -> UIViewController {
        switch self {
        case .list(let viewModel):
            var viewCont = MemoListViewController()
            viewCont.bind(viewModel: viewModel)
            return viewCont
        case .detail(let viewModel):
            var viewCont = MemoDetailViewController()
            viewCont.bind(viewModel: viewModel)
            return viewCont
        case .compose(let viewModel):
            var viewCont = MemoComposeViewController()
            viewCont.bind(viewModel: viewModel)
            return viewCont
        }
    }
}
