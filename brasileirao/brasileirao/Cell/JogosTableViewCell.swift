//
//  JogosTableViewCell.swift
//  brasileirao
//
//  Created by Ana Julia on 1/30/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import UIKit

class JogosTableViewCell: UITableViewCell{
    
    @IBOutlet var local: UILabel!
    @IBOutlet var data: UILabel!
    @IBOutlet var hora: UILabel!
    @IBOutlet var diaSemana: UILabel!
    @IBOutlet var golsCasa: UILabel!
    @IBOutlet var golsVisita: UILabel!
    @IBOutlet var siglaVisita: UILabel!
    @IBOutlet var siglaCasa: UILabel!
    @IBOutlet var escudoCasa: UIImageView!
    @IBOutlet var escudoVisita: UIImageView!
    
    var id: Int = Int.min

    func prepare (with jogo: JogoModel){
        diaSemana.text = jogo.data.formatDia()?.uppercased()
        data.text = jogo.data.formatData()
        local.text = jogo.local.uppercased()
        hora.text = jogo.data.formatHora()
        
        golsCasa.text = String(jogo.timeCasa.gols)
        siglaCasa.text = jogo.timeCasa.sigla.uppercased()
        escudoCasa.load(jogo.timeCasa.urlEscudo)
        
        golsVisita.text = String(jogo.timeVisitante.gols)
        siglaVisita.text = jogo.timeVisitante.sigla.uppercased()
        escudoVisita.load(jogo.timeVisitante.urlEscudo)
        
        self.id = jogo.id
        
    }
    
}


