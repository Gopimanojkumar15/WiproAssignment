//
//  Post.swift
//  AssignmentGopimanojkumar
//
//  Created by Gopimanojkumar on 19/6/24.

import Foundation

struct Header: Codable {
    let headerTitle: String
    let headerDescription: String
}

struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let color: String
    let imageURL: String
    let colorCode: String
    let available: Bool
    let releaseDate: Int
    let description: String
    let longDescription: String
    let rating: Double
    let price: Price
    var isFavorite: Bool? = false

}

struct Price: Codable {
    let value: Double
    let currency: String
}

struct ProductModel: Codable {
    
    let header: Header
    let filters: [String]
    let products: [Product]
    
}

struct ProductDummyModel {
    static let product: ProductModel = {
        if let defaultData: ProductModel = readJSONFromFile(fileName: "SamplePost") {
            return defaultData
        } else {
            fatalError("Failed to load default data")
        }
    }()
}
