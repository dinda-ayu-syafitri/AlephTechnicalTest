//
//  CategoryModel.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

struct Category: Codable, Equatable, Identifiable, Hashable {
    var id: Int
    var name: String
    var items: [Item]

    init(id: Int, name: String, items: [Item]) {
        self.id = id
        self.name = name
        self.items = items
    }
}
