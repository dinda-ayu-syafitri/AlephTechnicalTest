//
//  GetAllCategoriesUseCase.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

protocol GetAllCategoriesUseCase {
    func execute() async throws -> [Category]
}

class GetAllCategoriesUseCaseImpl: GetAllCategoriesUseCase {
    private let categoriesRepository: CategoriesRepositoryProtocol

    init(categoriesRepository: CategoriesRepositoryProtocol) {
        self.categoriesRepository = categoriesRepository
    }

    func execute() async throws -> [Category] {
        do {
            return try await categoriesRepository.getAllCategories()
        } catch {
            throw error
        }
    }
}
