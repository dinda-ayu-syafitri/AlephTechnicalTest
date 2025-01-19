//
//  CategoryMetadataModel.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

struct CategoryMetadata: Codable, Equatable, Hashable {
    var total_categories: Int
    var total_items: Int
    var request_time: String

    init(total_categories: Int, total_items: Int, request_time: String) {
        self.total_categories = total_categories
        self.total_items = total_items
        self.request_time = request_time
    }
}
