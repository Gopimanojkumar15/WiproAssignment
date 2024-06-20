//
//  ProductsDetailsViewModel.swift
//  AssignmentGopimanojkumar
//
//  Created by Gopimanojkumar on 20/6/24.
//

import Foundation

class ProductDetailsViewModel: ObservableObject {
    
    @Published var details: Product
    
    init(details: Product) {
        self.details = details
    }

    /// Method used to mark as Favorite
    func toggleFavorite() {
        if details.isFavorite == nil || details.isFavorite == false{
            details.isFavorite = true
        }else{
            details.isFavorite = false
        }
    }
}
