//
//  PostService.swift
//  AssignmentGopimanojkumar
//
//  Created by Gopimanojkumar on 20/6/24.
//

/* Whenever we will make a API call, we will use the service class to access network manager. We will prepare the necessary data to make a api call. like url, params, header etcs. */

import Foundation

protocol ServiceProtocol {
    
    func fetchData() async -> Result<ProductModel, APIError>
}


final class ProductService: ServiceProtocol {

    func fetchData() async -> Result<ProductModel, APIError> {
        let baseURL = "https://app.check24.de"
        let router = NetworkRouter(baseURL: baseURL)
        
        do {
            let result: Result<ProductModel, APIError> =  await router.sendRequest(path: "/products-test.json", method: .get)
            return result
        }
        
    }

}

