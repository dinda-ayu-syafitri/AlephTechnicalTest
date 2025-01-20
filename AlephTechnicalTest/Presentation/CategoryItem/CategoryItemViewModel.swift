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
    @Published var selectedItemId: Int?
    @Published var searchKeyword: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var showError: Bool = false

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
        isLoading = true

        defer {
            isLoading = false
        }

        do {
            let categoryData = try await getCategoryByIdUseCase.execute(categoryId: categoryId)
            category = categoryData
        } catch let error as networkingError {
            showError = true
            switch error {
            case .invalidURL:
                errorMessage = "URL is invalid, please check your URL."
            case .invalidResponse:
                errorMessage = "Invalid response, please try again later."
            case .invalidData:
                errorMessage = "Data is invalid, please try again later."
            case .networkFailure(let underlyingError):
                errorMessage = "Network error: \(underlyingError.localizedDescription). Please check your internet connection."
            case .noData:
                errorMessage = "No data available, please try again later."
            }
        } catch {
            showError = true
            errorMessage = "An unexpected error occurred: \(error.localizedDescription)."
        }
    }
}
