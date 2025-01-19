//
//  GetItemByIdUseCase.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

protocol GetItemByIdUseCase {
    func execute(itemId: Int) async throws -> Item
}

class GetItemByIdUseCaseImpl: GetItemByIdUseCase {
    private let categoriesRepository: CategoriesRepositoryProtocol

    init(categoriesRepository: CategoriesRepositoryProtocol) {
        self.categoriesRepository = categoriesRepository
    }

    func execute(itemId: Int) async throws -> Item {
        let categories = try await categoriesRepository.getAllCategories()

        for category in categories {
            if let item = category.items.first(where: { $0.id == itemId }) {
                return item
            }
        }

        throw NSError(domain: "GetItemByIdUseCaseError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Item not found"])
    }
}

