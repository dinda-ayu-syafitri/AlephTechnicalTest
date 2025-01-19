//
//  ItemModel.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

struct Item: Codable, Equatable, Identifiable, Hashable {
    var id: Int
    var title: String
    var description: String
    var image_url: String
    var details: itemDetails

    struct itemDetails: Codable, Equatable, Hashable {
        var author: String
        var published_date: String
        var tags: [String]
    }
}
