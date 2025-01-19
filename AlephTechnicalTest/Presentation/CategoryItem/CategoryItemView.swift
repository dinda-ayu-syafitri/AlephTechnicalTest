//
//  CategoryItemView.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import SwiftUI

struct CategoryItemView: View {
    @StateObject var vm = DependencyInjection.shared.categoryItemViewModel()
    @Environment(\.dismiss) var dismiss
    @Binding var categoryId: Int?

    var body: some View {
        ZStack {
            VStack {
                Image("categoryItem_bg")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            .ignoresSafeArea()

            if vm.isLoading {
                ZStack {
                    Color.white.opacity(0.8)
                        .ignoresSafeArea()
                    LoadingIndicatorView()
                }
            } else {
                ScrollView {
                    if !vm.filteredItems.isEmpty {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .leading, spacing: 20) {
                            ForEach(vm.filteredItems, id: \.self) { item in
                                NavigationLink(destination: ItemDetailView(itemId: $vm.selectedItemId)) {
                                    ItemThumbnailView(itemData: item)
                                        .simultaneousGesture(TapGesture().onEnded {
                                            vm.selectedItemId = item.id
                                        })
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    } else {
                        VStack {
                            Text("No Items Available")
                                .font(.title2)
                                .padding(.top, 50)
                        }
                    }
                }
                .searchable(text: $vm.searchKeyword, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for items...")
                .refreshable {
                    Task {
                        try await vm.getCategoryById()
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.accentBlue)
                }
            }

            ToolbarItem(placement: .principal) {
                Button(action: {}) {
                    Text("\(vm.category?.name ?? "No Category")")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.accentBlue)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            Task {
                vm.categoryId = categoryId ?? 0
                try await vm.getCategoryById()
            }
        }
    }
}

#Preview {
    CategoryItemView(categoryId: .constant(1))
}
