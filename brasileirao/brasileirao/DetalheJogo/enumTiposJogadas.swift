//
//  enumTiposJogadas.swift
//  brasileirao
//
//  Created by Ana Julia on 2/11/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation
import UIKit

enum TipoJogadas{
    case AMARELO
    case VERMELHO
    case SUBSTITUICAO
    case GOL
    case FIMJOGO
    
    var image: UIImage {
        guard let cartaoAmarelo = UIImage(named: "cartaoAmarelo.png") else {return UIImage()}
        guard let cartaoVermelho = UIImage(named: "cartaoVermelho.png") else {return UIImage()}
        guard let substituicao = UIImage(named: "iconeSubstituicao.png") else {return UIImage()}
        guard let fimJogo = UIImage(named: "iconeApito.png") else {return UIImage()}
        guard let gol = UIImage(named: "iconeGol.png") else {return UIImage()}
        
        switch self {
            case .AMARELO: return cartaoAmarelo
            case .VERMELHO: return cartaoVermelho
            case .SUBSTITUICAO: return substituicao
            case .FIMJOGO: return fimJogo
            case .GOL: return gol
        }
    }
}
