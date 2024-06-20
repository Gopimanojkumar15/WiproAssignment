//
//  MockPostNetworking.swift
//  AssignmentGopimanojkumar
//
//  Created by Gopimanojkumar on 20/6/24.
//

import Foundation

class MockProductService: ServiceProtocol {
    
    func fetchData() async -> Result<ProductModel, APIError> {
        guard let sampleData: ProductModel = readJSONFromFile(fileName: "SamplePost")else {
            return.failure(.invalidData)
            
        }
        return .success(sampleData)

    }    
}
