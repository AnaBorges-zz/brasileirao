//
//  JogoModel.swift
//  brasileirao
//
//  Created by Ana Julia on 1/28/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation

struct JogoModel : Codable {
    
    let id: Int
    let data: String
    let local: String
    let timeCasa: Time
    let timeVisitante: Time
}

struct Time: Codable{
    let nome: String
    let sigla: String
    let urlEscudo: String
    let gols: Int
}

    
