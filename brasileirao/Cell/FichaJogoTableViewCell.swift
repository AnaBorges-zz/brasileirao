//
//  FichaJogoTableViewCell.swift
//  brasileirao
//
//  Created by Ana Julia on 2/14/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import UIKit

class FichaJogoTableViewCell : UITableViewCell {
    @IBOutlet var nomeJogadorCasa: UILabel!
    @IBOutlet var numeroJogadorCasa: UILabel!
    @IBOutlet var posicaoJogadorCasa: UILabel!
    @IBOutlet var nomeJogadorVisitante: UILabel!
    @IBOutlet var numeroJogadorVisitante: UILabel!
    @IBOutlet var posicaoJogadorVisitante: UILabel!
    @IBOutlet var informacaoAdicionalCasa: UILabel!
    @IBOutlet var informacaoAdicionalCasaLabel: UILabel!
    @IBOutlet var informacaoAdicionalVisitante: UILabel!
    @IBOutlet var informacaoAdicionalVisitanteLabel: UILabel!
    
    func prepareJogador (_ jogadorCasa : Jogador, _ jogadorVisitante : Jogador) {
        nomeJogadorCasa.text = jogadorCasa.nome
        numeroJogadorCasa.text = String (jogadorCasa.camisa)
        posicaoJogadorCasa.text = jogadorCasa.posicao.uppercased()
        
        nomeJogadorVisitante.text = jogadorVisitante.nome
        numeroJogadorVisitante.text = String (jogadorVisitante.camisa)
        posicaoJogadorVisitante.text = jogadorVisitante.posicao.uppercased()
        
    }
    
    func prepareInformacoes (with jogador: FichaModel) {
        
    }
}

