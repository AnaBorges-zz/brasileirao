//
//  RouteAPI.swift
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
