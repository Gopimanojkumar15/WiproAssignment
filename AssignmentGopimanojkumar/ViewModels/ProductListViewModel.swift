//
//  PostViewModel.swift
//  AssignmentGopimanojkumar
//
//  Created by Gopimanojkumar on 20/6/24.
//

import Foundation
import UIKit

class ProductListViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    private let service: ServiceProtocol

    init(service: ServiceProtocol) {
        self.service = service
        Task {
            await fetchPosts()
        }
    }
    
    /// Method used to fetch products from API & Update to Product Model
    @MainActor func fetchPosts() async {
        isLoading = true

            let result =  await service.fetchData()
            switch result {
            case .success(let data):
                // Handle the successful case with the productModel
                self.products = data.products
                isLoading = false

            case .failure(let error):
                // Handle the APIError in the failure case
                self.errorMessage = "Failed to fetch posts: \(error.getErrorMessage())"
                isLoading = false

            }

    }
    
    func updateProduct(_ updatedProduct: Product) {
        guard let index = products.firstIndex(where: { $0.id == updatedProduct.id }) else {
            return
        }
        products[index] = updatedProduct
    }

}
