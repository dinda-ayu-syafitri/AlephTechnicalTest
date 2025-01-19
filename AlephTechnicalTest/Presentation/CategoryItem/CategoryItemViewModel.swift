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
    @Published var searchKeyword: String = ""

    var filteredItems: [Item] {
        guard let items = category?.items else { return [] }
        if searchKeyword.isEmpty {
            return items
        } else {
            return items.filter { item in
                item.title.localizedCaseInsensitiveContains(searchKeyword) ||
                item.details.tags.contains { $0.localizedCaseInsensitiveContains(searchKeyword) }
            }
        }
    }

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
