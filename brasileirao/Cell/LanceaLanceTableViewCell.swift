//
//  LanceaLanceTableViewCell.swift
//  brasileirao
//
//  Created by Ana Julia on 2/11/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation
import UIKit


class LanceaLanceTableViewCell: UITableViewCell {
    
    @IBOutlet var nomeJogador: UILabel!
    @IBOutlet var posicaoJogador: UILabel!
    @IBOutlet var imageEscudo: UIImageView!
    @IBOutlet var minuto: UILabel!
    @IBOutlet var tempo: UILabel!
    @IBOutlet var iconeTipo: UIImageView!
    @IBOutlet var nomeNovoJogodor: UILabel!
    @IBOutlet var posicaoNovoJogador: UILabel!
    
    func prepare(with lance: LanceALanceModel){
        if self.reuseIdentifier == "cellLanceSubstituicao"{
            nomeNovoJogodor.text = (lance.novo_jogador as! String)
            posicaoNovoJogador.text = lance.nova_posicao as! String
        }
        else if self.reuseIdentifier == "cellLanceFimJogo"{
            minuto.text = "\(lance.minuto)'"
            tempo.text = "\(lance.tempo)º tempo"
            iconeTipo.image = returnImage(tipo: lance.tipo)
            return
        }
        
        nomeJogador.text = lance.nomeJogador
        posicaoJogador.text = lance.posicao
        imageEscudo.load(lance.urlEscudo)
        minuto.text = "\(lance.minuto)'"
        tempo.text = "\(lance.tempo)º tempo"
        iconeTipo.image = returnImage(tipo: lance.tipo)
        
    }
    
    func returnImage(tipo: String) -> UIImage{
        switch tipo {
        case "AMARELO":
            return TipoJogadas.AMARELO.image
        case "VERMELHO":
            return TipoJogadas.VERMELHO.image
        case "SUBSTITUICAO":
            return TipoJogadas.SUBSTITUICAO.image
        case "GOL":
            return TipoJogadas.GOL.image
        case "FIMJOGO":
            return TipoJogadas.FIMJOGO.image
        default:
            return TipoJogadas.GOL.image
        }
    }
}
