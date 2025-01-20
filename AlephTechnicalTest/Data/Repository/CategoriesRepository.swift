//
//  CategoriesRepository.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

class CategoriesRepository: CategoriesRepositoryProtocol {
    private let categoryRemoteDataSource: CategoriesRemoteDataSourceProtocol

    init(categoryRemoteDataSource: CategoriesRemoteDataSourceProtocol) {
        self.categoryRemoteDataSource = categoryRemoteDataSource
    }

    func getAllCategories() async throws -> [Category] {
        do {
            return try await categoryRemoteDataSource.getAllCategories()
        } catch let error as networkingError {
            throw error
        }
    }
}
