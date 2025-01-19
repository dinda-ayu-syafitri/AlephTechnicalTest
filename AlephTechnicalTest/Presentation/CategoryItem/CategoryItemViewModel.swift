//
//  CategoryItemViewModel.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

class CategoryItemViewModel: ObservableObject {
    private let getCategoryByIdUseCase: GetCategoryByIdUseCase

    init(getCategoryByIdUseCase: GetCategoryByIdUseCase) {
        self.getCategoryByIdUseCase = getCategoryByIdUseCase
    }

    @Published var category: Category?
    @Published var categoryId = 0

    @MainActor
    func getCategoryById() async throws {
        do {
            let categoryData = try await getCategoryByIdUseCase.execute(categoryId: categoryId)
            category = categoryData
        } catch {
            print("Error getting category by ID")
        }
    }
}
