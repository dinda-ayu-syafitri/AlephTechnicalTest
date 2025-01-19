//
//  HomeView.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 18/01/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = DependencyInjection.shared.homeViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 30) {
                Text("Categories")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)

                ScrollView {
                    ForEach(vm.categories, id: \.self) { category in
                        NavigationLink(destination: CategoryItemView(categoryId: $vm.selectedCategoryId), label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(category.name)")
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.top, 60)
                            .padding(.bottom, 20)
                            .background(.gray)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 8))
                            .simultaneousGesture(TapGesture().onEnded {
                                vm.selectedCategoryId = category.id
                            })
                        })
                    }
                    Spacer()
                }
                .refreshable {
                    Task {
                        try await vm.getAllCategories()
                    }
                }
            }
            .padding(.top, 30)
            .padding(.horizontal, 20)
            .onAppear {
                Task {
                    try await vm.getAllCategories()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
