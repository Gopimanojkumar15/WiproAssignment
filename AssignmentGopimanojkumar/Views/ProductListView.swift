//
//  ContentView.swift
//  AssignmentGopimanojkumar
//
//  Created by Gopimanojkumar on 19/6/24.
//

import SwiftUI

///This view is used to render product list view
    struct ProductListView: View {
        
        @ObservedObject private var viewModel = ProductListViewModel(service: ProductService())

        var body: some View {
            NavigationView {
                VStack {
                    if viewModel.isLoading {
                        ProgressView()
                    } else if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .accessibilityLabel(viewModel.errorMessage)
                    } else {
                        List(viewModel.products) { product in

                            
                            NavigationLink {
                                DetailsView(viewModel: ProductDetailsViewModel(details: product)){ updatedProduct in
                                    // Handle updated product (favorite status) from DetailsView
                                    viewModel.updateProduct(updatedProduct)
                                }
                                
                            } label: {
                                HStack {
                                    if #available(iOS 15.0, *) {
                                        AsyncImage(url: URL(string: product.imageURL))
                                    } else {
                                        // Fallback on earlier versions
                                        Image(product.imageURL)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(product.name)
                                            .font(.headline)
                                            .accessibilityLabel(product.name)
                                        Text(product.type)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            .accessibilityLabel(product.type)
                                        if (product.isFavorite == true) {
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                        }
                                    }
                                }
                            }
           
                        }
                        
                    }
                }
                .navigationTitle("Products")
            }
        }
        
    }

struct PostListView_RealPreviews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductListViewModel(service: MockProductService())
        return ProductListView().environmentObject(viewModel)
    }
}
