//
//  TabelaJogosController.swift
//  brasileirao
//
//  Created by Ana Julia on 1/29/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import UIKit

class TabelaJogosController: UITableViewController{
    
    @IBOutlet var rodadasBar: UINavigationItem!
    
    var jogos : [JogoModel] = []
    var rodada: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mudarRodada(rodada: rodada)
    }
    
    @IBAction func proximaRodada(_ sender: UIBarButtonItem) {
        rodada+=1
        mudarRodada(rodada: rodada)
    }

    @IBAction func rodadaAnterior(_ sender: UIBarButtonItem) {
        rodada-=1
        mudarRodada(rodada: rodada)
    }
    
    func mudarRodada(rodada: Int){
        rodadasBar.title = "\(rodada)º rodada"
        
        if rodada > 1 {
            rodadasBar.leftBarButtonItem?.isEnabled = true
        }
        else{
            rodadasBar.leftBarButtonItem?.isEnabled = false
        }
    
        
        if rodada > 2{
            rodadasBar.rightBarButtonItem?.isEnabled = false
        }
        else{
            rodadasBar.rightBarButtonItem?.isEnabled = true
        }
        
        
        Requisitions.loadJogos(rodada: rodada, token: LoginController.token, onComplete: { (jogos) in
            
            self.jogos = jogos
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }) { (error) in
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jogos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellJogo", for: indexPath) as! JogosTableViewCell
        
        let jogo = jogos[indexPath.row]
        
        cell.prepare(with: jogo)
        
        return cell
    }
}
