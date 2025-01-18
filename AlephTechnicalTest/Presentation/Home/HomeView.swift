//
//  HomeView.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 18/01/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Categories")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading, spacing: 4) {
                Text("Category 1")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.top, 60)
            .padding(.bottom, 20)
            .background(.gray)
            .clipShape(.rect(cornerRadius: 8))

            Spacer()
        }
        .padding(.top, 30)
        .padding(.horizontal, 20)
    }
}

#Preview {
    HomeView()
}
