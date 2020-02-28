//
//  APIClient.swift
//  brasileirao
//
//  Created by Ana Julia on 2/12/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation

class APIClient{
    private let basePath = "https://private-62ae5-brasileirao8.apiary-mock.com/"
    
    lazy private var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type" : "application/json"]
        return URLSession(configuration: config)
    }()
    
    func request(route: AppRoute, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        
        guard let url = URL(string: basePath + route.path) else {
            print("deu ruim")
            let error = NSError(domain: "com.myCompany.brasileirao", code: 500, userInfo: nil)
            completion(nil, error)
            return
        }
               
        var request = URLRequest(url:url)
        request.httpMethod = route.metod
        
        if route.routeAutenticate {
            request.setValue(UserDefaults.standard.string(forKey: "token"), forHTTPHeaderField: "token")
        }
        
       let dataTask = session.dataTask(with: request) { (data, response, error) in
           if error != nil {
                print("não funfou")
                completion(nil, error)
                return
        }
        
        guard let response = response as? HTTPURLResponse else {
            completion(nil, error)
            return
        }

        if response.statusCode >= 200 && response.statusCode <= 299, let data = data {
                    completion(data, nil)
               }
               else {
                print(response.statusCode)
                completion(nil, error)
                return
            }
           
       }
       dataTask.resume()
    }
    
}
