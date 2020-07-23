//
//  MemoListViewModel.swift
//  mvvm
//
//  Created by marbean on 2020/07/13.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel {
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
}
