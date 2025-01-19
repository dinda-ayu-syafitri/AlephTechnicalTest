//
//  CategoryItemView.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import SwiftUI

struct CategoryItemView: View {
    @Binding var categoryId: Int?

    var body: some View {
        Text("This is Category \(categoryId ?? 0) Item View")
    }
}

#Preview {
    CategoryItemView(categoryId: .constant(1))
}
