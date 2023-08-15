//
//  ListViewModel.swift
//  TodoList
//
//  Created by xavier on 12/08/23.
//

import Foundation
import CoreData

class ListViewModel: ObservableObject {
    
    private let container: NSPersistentContainer
    private let containerName: String = "ItemContainer"
    private let entityName: String = "ItemEntity"
    
    @Published var savedItems: [ItemEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading core data \(error)")
            }
        }
        fetchItems()
    }
    
    public func fetchItems(){
        let request = NSFetchRequest<ItemEntity>(entityName: entityName)
        
        do {
             savedItems = try container.viewContext.fetch(request)
        } catch let error {
            print("Error \(error)")
        }
    }
    
    public func deleteItem(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedItems[index]
        container.viewContext.delete(entity)
        saveItem()
    }
    
    public func moveItem(from: IndexSet, to: Int) {
        //items.move(fromOffsets: from, toOffset: to)
    }
    
    public func addItem(title: String) {
        let newItem = ItemEntity(context: container.viewContext)
        newItem.title = title
        newItem.isCompleted = false
        saveItem()
    }
    
    func updateItem(entity: ItemEntity) {
        entity.isCompleted = !entity.isCompleted
        saveItem()
    }
    
    func saveItem() {
        do {
            try container.viewContext.save()
            fetchItems()
        } catch let error {
            print("Error saving: \(error)")
        }
    }
}
