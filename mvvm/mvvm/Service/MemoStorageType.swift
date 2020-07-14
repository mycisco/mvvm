//
//  MemoStorageType.swift
//  mvvm
//
//  Created by marbean on 2020/07/13.
//

import Foundation
import RxSwift

protocol MemoStroageType {
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[Memo]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
