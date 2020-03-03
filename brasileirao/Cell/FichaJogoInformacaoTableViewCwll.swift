//
//  FichaJogoInformacaoTableViewCwll.swift
//  brasileirao
//
//  Created by Ana Julia on 3/2/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import UIKit

class FichaJogoInformacaoTableViewCell : UITableViewCell {
    
    @IBOutlet var informacaoAdicionalCasaTitle: UILabel!
    @IBOutlet var informacaoAdicionalVisitanteTitle: UILabel!
    @IBOutlet var informacaoAdicionalLabelCasa: UILabel!
    @IBOutlet var informacaoAdicionalLabelVisitante: UILabel!

    
    func prepareInformacoes (titleCasa titleCasa: String, titleVisitante titleVisitante: String, label label: String) {
        
        informacaoAdicionalLabelCasa.text = label.uppercased()
        informacaoAdicionalLabelVisitante.text = label.uppercased()
        informacaoAdicionalCasaTitle.text = titleCasa
        informacaoAdicionalVisitanteTitle.text = titleVisitante
            
    }
    
}
