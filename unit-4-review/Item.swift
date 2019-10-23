//
//  Item.swift
//  unit-4-review
//
//  Created by David Rifkin on 10/23/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct Item: Codable {
    let name: String
    let price: Double //some kind of number
    let image: Data
}
