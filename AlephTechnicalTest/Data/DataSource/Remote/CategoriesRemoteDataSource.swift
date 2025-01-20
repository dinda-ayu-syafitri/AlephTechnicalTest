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

        guard let url = URL(string: endpoint) else {
            throw networkingError.invalidURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw networkingError.invalidResponse
            }

            let decoder = JSONDecoder()
            let apiResponse = try decoder.decode(APIResponse<CategoryResponseDataModel, CategoryMetadata>.self, from: data)
            return apiResponse.data.categories
        } catch {
            if (error as? URLError) != nil {
                throw networkingError.networkFailure(error) // Handle network failure (e.g., no internet connection)
            } else if (error as? DecodingError) != nil {
                throw networkingError.invalidData // Handle data decoding error
            } else {
                throw networkingError.networkFailure(error) // Handle any other network-related error
            }
        }
    }
}
