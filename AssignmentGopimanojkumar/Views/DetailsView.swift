//
//  DetailsUIView.swift
//  AssignmentGopimanojkumar
//
//  Created by Gopimanojkumar on 19/6/24.
//

import SwiftUI

/// View is used to render Detailed view
struct DetailsView: View {
    @ObservedObject var viewModel: ProductDetailsViewModel
    var onFavoriteChanged: ((Product) -> Void)?

    var body: some View {
        VStack {
            Text(viewModel.details.name)
                .font(.headline)
                .accessibilityLabel(viewModel.details.name)
            Text(viewModel.details.type)
                .font(.subheadline)
                .foregroundColor(.gray)
                .accessibilityLabel(viewModel.details.type)
            
            Button(action: {
                viewModel.toggleFavorite()
                // Notify the callback when the favorite status changes
                onFavoriteChanged?(viewModel.details)

            }, label: {
                Text(viewModel.details.isFavorite ?? false ? "Remove from Favorites" : "Mark as Favorite")
                    .foregroundColor(.blue)
            })
            
        }
        .navigationTitle("Product Details")
    }
}

 
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let data = ProductDummyModel.product
        return DetailsView(viewModel: ProductDetailsViewModel(details: data.products[0]))
    }
}

