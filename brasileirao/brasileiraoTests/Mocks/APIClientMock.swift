//
//  APIClientMock.swift
//  brasileiraoTests
//
//  Created by Ana Julia on 3/13/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation
@testable import brasileirao

class APIClientMock : APIClientProtocol {
    
    let retornoLogin = "{ token: hfkjdshkjhsdjhfskd }".data(using: .utf8)
    
    func request(route: AppRoute, completion: @escaping (Data?, APIError?) -> Void) {
        if route.path == "/login" {
            completion(retornoLogin, nil)
            return
        }
        completion(nil, nil)
    }
    
}
