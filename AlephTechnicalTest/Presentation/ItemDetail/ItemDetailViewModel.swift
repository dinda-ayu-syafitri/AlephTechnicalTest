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

    @MainActor
    func getItemById() async throws {
        do {
            let itemData = try await getItemByIdUseCase.execute(itemId: itemId)
            item = itemData
        } catch {
            print("Error getting item by ID")
        }
    }
}
