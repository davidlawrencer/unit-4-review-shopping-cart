//
//  ItemPersistenceHelper.swift
//  unit-4-review
//
//  Created by David Rifkin on 10/23/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct ItemPersistenceHelper {
    private static var list = [Item]()
    static let manager = ItemPersistenceHelper()
    
    func save(newItem: Item) throws {
        try persistenceHelper.save(newElement: newItem)
    }
    func getItems() throws -> [Item] {
        return try persistenceHelper.getObjects()
    }

    func delete(index: Int) throws {
        return try persistenceHelper.deleteAtIndex(index: index)
}
    private let persistenceHelper = PersistenceHelper<Item>(fileName: "shoppingCart.plist")
    private init() {}
}
