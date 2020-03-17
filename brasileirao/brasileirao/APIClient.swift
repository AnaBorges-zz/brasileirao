//
//  APIClient.swift
//  brasileirao
//
//  Created by Ana Julia on 2/12/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation

enum APIError: Error {
    case urlParse
    case castUrlResponse
    case notFound
    case undefined
}

protocol APIClientProtocol {
    func request(route: AppRoute, completion: @escaping (_ data: Data?, _ error: APIError?) -> Void)
}

class APIClient : APIClientProtocol{
    private let basePath = "https://private-62ae5-brasileirao8.apiary-mock.com/"
    
    lazy private var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type" : "application/json"]
        return URLSession(configuration: config)
    }()
    
    func request(route: AppRoute, completion: @escaping (_ data: Data?, _ error: APIError?) -> Void) {
        
        guard let url = URL(string: basePath + route.path) else {
            completion(nil, APIError.urlParse)
            return
        }
               
        var request = URLRequest(url:url)
        request.httpMethod = route.metod
        
        if route.routeAutenticate {
            request.setValue(UserDefaults.standard.string(forKey: "token"), forHTTPHeaderField: "token")
        }
        
       let dataTask = session.dataTask(with: request) { (data, response, error) in
           if error != nil {
            completion(nil, error as? APIError)
                return
        }
        
        guard let response = response as? HTTPURLResponse else {
            completion(nil, APIError.castUrlResponse)
            return
        }

        if response.statusCode >= 200 && response.statusCode <= 299, let data = data {
            completion(data, nil)
            print("response: \(response.statusCode)")
        }
       else {
            
            switch response.statusCode {
                case 404:
                    completion(nil, APIError.notFound)
                default:
                    completion(nil, APIError.undefined)
            }
            
        return
    }
           
       }
       dataTask.resume()
    }
    
}
