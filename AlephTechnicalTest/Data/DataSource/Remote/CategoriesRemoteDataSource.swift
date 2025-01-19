//
//  CategoriesRemoteDataSource.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

class CategoriesRemoteDataSource: CategoriesRemoteDataSourceProtocol {
    func getAllCategories() async throws -> [Category] {
        let endpoint = "https://private-90107f-alephtechnicaltestdindaas.apiary-mock.com/category"

        guard let url = URL(string: endpoint) else { throw networkingError.invalidURL }

        let (value, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw networkingError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            let apiResponse = try decoder.decode(APIResponse<CategoryResponseDataModel, CategoryMetadata>.self, from: value)
            return apiResponse.data.categories
        } catch {
            print("Decoding failed with error:", error)
            throw networkingError.invalidData
        }
    }
}
