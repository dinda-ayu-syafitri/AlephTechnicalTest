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

    @MainActor
    func getAllCategories() async throws {
        do {
            let categoriesData = try await getAllCategoriesUseCase.execute()
            categories = categoriesData
        } catch networkingError.invalidURL {
            print("Invalid URL", Error.self)
            throw networkingError.invalidURL
        } catch networkingError.invalidResponse {
            print("Invalid Response", Error.self)
            throw networkingError.invalidResponse
        } catch networkingError.invalidData {
            print("Invalid Data", Error.self)
            throw networkingError.invalidData
        }
    }
}
