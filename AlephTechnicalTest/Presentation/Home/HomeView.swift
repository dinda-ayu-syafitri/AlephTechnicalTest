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
            ZStack {
                VStack {
                    Spacer()
                    Image("home_bg")
                        .resizable()
                        .scaledToFit()
                }
                .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 30) {
                    Text("Categories")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(Color.accentBlue)
                        .padding(.horizontal, 20)

                    ScrollView {
                        ForEach(vm.categories, id: \.self) { category in
                            NavigationLink(destination: CategoryItemView(categoryId: $vm.selectedCategoryId), label: {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("\(category.name)")
                                        .font(.headline)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                                .padding(.top, 60)
                                .padding(.bottom, 20)
                                .background(.customWhite)
                                .foregroundStyle(.accentOrange)
                                .clipShape(.rect(cornerRadius: 8))
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.1), radius: 5)
                                .padding(.bottom, 20)
                                .padding(.horizontal, 20)
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
                .onAppear {
                    Task {
                        try await vm.getAllCategories()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
