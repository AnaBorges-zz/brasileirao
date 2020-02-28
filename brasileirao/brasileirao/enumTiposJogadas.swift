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
        switch self {
            case .AMARELO: return UIImage(named: "cartaoAmarelo.png")!
            case .VERMELHO: return UIImage(named: "cartaoVermelho.png")!
            case .SUBSTITUICAO: return UIImage(named: "iconeSubstituicao.png")!
            case .FIMJOGO: return UIImage(named: "iconeApito.png")!
            case .GOL: return UIImage(named: "iconeGol.png")!
        }
    }
}
