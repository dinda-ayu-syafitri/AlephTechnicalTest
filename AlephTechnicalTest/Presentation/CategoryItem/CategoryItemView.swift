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
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .leading, spacing: 20) {
                    if let items = vm.category?.items {
                        ForEach(items, id: \.self) { item in
                            ItemThumbnailView(itemData: item)
                        }
                    } else {
                        Text("No Item")
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .fontWeight(.semibold)
                }
            }

            ToolbarItem(placement: .principal) {
                Button(action: {}) {
                    Text("Category \(categoryId ?? 0)")
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
