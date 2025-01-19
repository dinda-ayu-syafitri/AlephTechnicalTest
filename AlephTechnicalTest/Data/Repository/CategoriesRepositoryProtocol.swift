//
//  CategoriesRepositoryProtocol.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

protocol CategoriesRepositoryProtocol {
    func getAllCategories() async throws -> [Category]
}
