//
//  GetCategoryByIdUseCase.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

protocol GetCategoryByIdUseCase {
    func execute(categoryId: Int) async throws -> Category
}

class GetCategoryByIdUseCaseImpl: GetCategoryByIdUseCase {
    private let categoriesRepository: CategoriesRepositoryProtocol

    init(categoriesRepository: CategoriesRepositoryProtocol) {
        self.categoriesRepository = categoriesRepository
    }

    func execute(categoryId: Int) async throws -> Category {
        do {
            let categories = try await categoriesRepository.getAllCategories()

            if let category = categories.first(where: { $0.id == categoryId }) {
                return category
            } else {
                throw NSError(domain: "GetCategoryByIdUseCaseError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Category not found"])
            }
        } catch {
            throw error
        }
    }
}
