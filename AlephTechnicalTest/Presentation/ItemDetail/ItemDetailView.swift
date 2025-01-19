//
//  ItemDetailView.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import SwiftUI

struct ItemDetailView: View {
    @StateObject var vm = DependencyInjection.shared.itemDetailViewModel()
    @Environment(\.dismiss) var dismiss
    @Binding var itemId: Int?

    var body: some View {
        VStack {
            if vm.isLoading {
                ZStack {
                    Color.white.opacity(0.8)
                        .ignoresSafeArea()
                    LoadingIndicatorView()
                }
            } else {
                VStack {
                    AsyncImage(url: URL(string: "\(vm.item?.image_url ?? "https://picsum.photos/id/237/300/200")")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 400)

                    VStack(spacing: 50) {
                        Text("\(vm.item?.title ?? "No Title Item")")
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        VStack {
                            Text("\(vm.item?.description ?? "No Description Item")")
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text("\(vm.item?.details.author ?? "No Author Item")")
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], alignment: .leading, spacing: 20) {
                            if let tags = vm.item?.details.tags {
                                ForEach(tags, id: \.self) { tag in
                                    Text("\(tag)")
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 10)
                                        .background(.accentOrange)
                                        .foregroundStyle(.customWhite)
                                        .clipShape(.rect(cornerRadius: 5))
                                }
                            } else {
                                Text("No Item")
                            }
                        }

                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
                .ignoresSafeArea()
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
                            Text("Item \(itemId ?? 0)")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(.accentBlue)
                        }
                    }
                }
                .navigationBarBackButtonHidden()
            }
        }
        .onAppear {
            Task {
                vm.itemId = itemId ?? 0
                try await vm.getItemById()
            }
        }
    }
}

#Preview {
    ItemDetailView(itemId: .constant(1))
}
