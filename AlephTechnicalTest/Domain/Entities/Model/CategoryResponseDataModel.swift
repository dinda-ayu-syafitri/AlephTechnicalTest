//
//  CategoryResponseDataModel.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

struct CategoryResponseDataModel: Codable, Equatable, Hashable {
    var categories: [Category]

    init(categories: [Category]) {
        self.categories = categories
    }
}
