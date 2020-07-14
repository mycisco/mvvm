//
//  MemoryStorage.swift
//  mvvm
//
//  Created by marbean on 2020/07/13.
//

import Foundation
import RxSwift

class MemoryStorage: MemoStroageType {
    
    private var list: [Memo] = [
        Memo(content: "Hello", inserDate: Date().addingTimeInterval(-10)),
        Memo(content: "Lorem Ipsum", inserDate: Date().addingTimeInterval(-20))
    ]
    
    private lazy var store = BehaviorSubject<[Memo]>(value: self.list)
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content)
        self.list.insert(memo, at: 0)
        store.onNext(self.list)
        return Observable.just(memo)
    }
    
    @discardableResult
    func memoList() -> Observable<[Memo]> {
        return self.store
    }
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updateContent: content)
        
        if let index = list.firstIndex(where: { $0 == memo }) {
            
            self.list.remove(at: index)
            self.list.insert(updated, at: index)
            
        }
        
        self.store.onNext(self.list)
        return Observable.just(updated)
    }
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = self.list.firstIndex(where: { $0 == memo }) {
            self.list.remove(at: index)
        }
        
        self.store.onNext(self.list)
        return Observable.just(memo)
    }
}
