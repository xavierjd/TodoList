//
//  ItemModel.swift
//  TodoList
//
//  Created by xavier on 12/08/23.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: self.id, title: title, isCompleted: !isCompleted)
    }
}
