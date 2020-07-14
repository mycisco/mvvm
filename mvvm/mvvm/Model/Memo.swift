//
//  Memo.swift
//  mvvm
//
//  Created by marbean on 2020/07/13.
//

import Foundation

struct Memo: Equatable {
    var content: String
    var inserDate: Date
    var idnentity: String
    
    init(content: String, inserDate: Date = Date()) {
        self.content = content
        self.inserDate = inserDate
        self.idnentity = "\(inserDate.timeIntervalSinceReferenceDate)"
    }
    
    init(original: Memo, updateContent: String) {
        self = original
        self.content = updateContent
    }
}
