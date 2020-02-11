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
    
    func prepare(with lance: LanceALanceModel){
        nomeJogador.text = lance.nomeJogador
        posicaoJogador.text = lance.posicao
        imageEscudo.load(lance.urlEscudo)
        minuto.text = "\(lance.minuto)'"
        tempo.text = "\(lance.tempo)º tempo"
    }
    
}
