//
//  FichaModel.swift
//  brasileirao
//
//  Created by Ana Julia on 2/4/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation

struct FichaModel: Codable{
    let timeCasa: TimeFicha
    let timeVisitante: TimeFicha
}

struct TimeFicha: Codable{
    let tecnico: String
    let esquema: String
    let jogadores: [Jogador]
    let reservas: [Jogador]
}

struct Jogador: Codable{
    let nome: String
    let camisa: Int
    let posicao: String
}
