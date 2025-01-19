//
//  DependencyInjection.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

class DependencyInjection: ObservableObject {
    static let shared = DependencyInjection()

    lazy var categoriesRemoteDataSource = CategoriesRemoteDataSource()
    lazy var categoriesRepository = CategoriesRepository(categoryRemoteDataSource: categoriesRemoteDataSource)

    lazy var getAllCategoriesUseCase = GetAllCategoriesUseCaseImpl(categoriesRepository: categoriesRepository)
    lazy var getCategoryByIdUseCase = GetCategoryByIdUseCaseImpl(categoriesRepository: categoriesRepository)

    func homeViewModel() -> HomeViewModel {
        HomeViewModel(getAllCategoriesUseCase: getAllCategoriesUseCase)
    }

    func categoryItemViewModel() -> CategoryItemViewModel {
        CategoryItemViewModel(getCategoryByIdUseCase: getCategoryByIdUseCase)
    }
}
