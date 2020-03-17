//
//  LoginRoute.swift
//  brasileirao
//
//  Created by Ana Julia on 2/12/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation

protocol RouteAPI{
    var path: String { get }
    var metod: String { get }
    var headers: [String : Any] { get }
    var parameters: [String : Any] { get }
}

enum AppRoute : RouteAPI{
    
    case login(login: String, password: String)
    case jogos(rodada: Int)
    case lances(jogo: Int)
    case ficha(jogo: Int)
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        case let .jogos(rodada):
            return "/jogos/\(rodada)"
        case let .lances(jogo):
            return "/lances/\(jogo)"
        case let .ficha(jogo):
            return "/ficha/\(jogo)"
        }
    }
    
    var metod: String{
        switch self {
        case .login:
            return "POST"
        default:
            return "GET"
        }
    }
    
    var headers: [String : Any]{
        return [:]
    }
    
    var routeAutenticate: Bool{
        switch self {
        case .login:
            return false
        default:
            return true
        }
    }
    
    var parameters:[String : Any]{
        switch self {
        case let .login(login, password):
            return ["login" : login, "password" : password]
        default:
            return [:]
        }
    }
    
}
