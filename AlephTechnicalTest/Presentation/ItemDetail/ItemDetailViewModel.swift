//
//  ItemDetailViewModel.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

class ItemDetailViewModel: ObservableObject {
    private let getItemByIdUseCase: GetItemByIdUseCase

    init(getItemByIdUseCase: GetItemByIdUseCase) {
        self.getItemByIdUseCase = getItemByIdUseCase
    }

    @Published var item: Item?
    @Published var itemId = 0
    @Published var isLoading: Bool = false

    @MainActor
    func getItemById() async throws {
        isLoading = true

        defer {
            isLoading = false
        }

        do {
            let itemData = try await getItemByIdUseCase.execute(itemId: itemId)
            item = itemData
        } catch {
            print("Error getting item by ID")
        }
    }
}
