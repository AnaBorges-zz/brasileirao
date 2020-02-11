//
//  JogosTableViewCell.swift
//  brasileirao
//
//  Created by Ana Julia on 1/30/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation
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
    
    @IBAction func maisDetalhes(_ sender: Any) {
        
    }
    var id: Int = Int.min

    func prepare (with jogo: JogoModel){
        diaSemana.text = formatDia(jogo.data).uppercased()
        data.text = formatData(jogo.data)
        local.text = jogo.local.uppercased()
        hora.text = formatHora(jogo.data)
        
        golsCasa.text = String(jogo.timeCasa.gols)
        siglaCasa.text = jogo.timeCasa.sigla.uppercased()
        escudoCasa.load(jogo.timeCasa.urlEscudo)
        
        golsVisita.text = String(jogo.timeVisitante.gols)
        siglaVisita.text = jogo.timeVisitante.sigla.uppercased()
        escudoVisita.load(jogo.timeVisitante.urlEscudo)
        
        self.id = jogo.id
        
    }
    
    
    let formatter = DateFormatter()

    func transformStringToDate(_ dataString: String) -> Date {
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.locale = Locale(identifier: "pt-br")

        let date = formatter.date(from: dataString)
     
        return date!
    }
    
    func formatData(_ dataString: String) -> String{
        let date = transformStringToDate(dataString)
        
        formatter.dateFormat = "dd/MM/yyyy"
        let dataString = formatter.string(from: date)

        return dataString
    }
    
    func formatHora(_ dataString: String) -> String{
        let date = transformStringToDate(dataString)
        formatter.dateFormat = "HH:mm"
        
        let horaString = formatter.string(from: date)

        return horaString
    }
    
    func formatDia(_ dataString: String) -> String{
        let date = transformStringToDate(dataString)
        formatter.dateFormat = "E"
        
        let horaString = formatter.string(from: date)

        return horaString
    }
}


