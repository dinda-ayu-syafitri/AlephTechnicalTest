//
//  ItemThumbnailView.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import SwiftUI

struct ItemThumbnailView: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://fastly.picsum.photos/id/717/200/300.jpg?hmac=OJYQhMLNcYlN5qz8IR345SJ7t6A0vyHzT_RdMxO4dSc")) { image in
                image
                    .resizable()
                    .scaledToFill()

            } placeholder: {
                Color.red
            }
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .clipShape(.rect(cornerRadius: 5))
            .padding(5)

            VStack(alignment: .leading) {
                Text("Item 1")
                    .font(.system(size: 15, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                Text("This is the description")
                    .font(.system(size: 12))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 20)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.1), radius: 5)
    }
}

#Preview {
    ItemThumbnailView()
}
