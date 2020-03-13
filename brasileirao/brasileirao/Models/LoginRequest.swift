//
//  LoginRequest.swift
//  brasileirao
//
//  Created by Ana Julia on 2/7/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation

struct Login: Codable {
    
    let login: String
    let password: String
    
    private enum CodingKeys: String, CodingKey{
        case login = "login"
        case password = "senha"
    }
    
}
