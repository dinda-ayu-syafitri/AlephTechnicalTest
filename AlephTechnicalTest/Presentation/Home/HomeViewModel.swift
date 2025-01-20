//
//  HomeViewModel.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let getAllCategoriesUseCase: GetAllCategoriesUseCaseImpl

    init(getAllCategoriesUseCase: GetAllCategoriesUseCaseImpl) {
        self.getAllCategoriesUseCase = getAllCategoriesUseCase
    }

    @Published var categories: [Category] = []
    @Published var selectedCategoryId: Int?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var showError: Bool = false

    @MainActor
    func getAllCategories() async {
        isLoading = true

        defer {
            isLoading = false
        }

        do {
            let categoriesData = try await getAllCategoriesUseCase.execute()
            categories = categoriesData
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
