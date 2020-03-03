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
    
    let apiClient = APIClient()

    var jogos : [JogoModel] = []
    var rodada: Int = 1
    var jogoSelecionado: JogoModel?
    
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
        
        rodadasBar.leftBarButtonItem?.isEnabled = rodada > 1
        rodadasBar.rightBarButtonItem?.isEnabled = rodada < 3
        
        requisitionAPI()
    }
    
    func requisitionAPI(){
        let route = AppRoute.jogos(rodada: rodada)
        
        apiClient.request(route: route) { (data, error) in
            if let error = error{
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do{
                let jogos = try JSONDecoder().decode([JogoModel].self, from: data)
                self.jogos = jogos
                                                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch{
                print(error)
            }
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "detalheJogo"{
            let destination = segue.destination as? LanceALanceController
            
            guard let destiny = destination else {return}
            guard let jogoSelected = jogoSelecionado else {return}

            destiny.jogoSelecionado = jogoSelected
            destiny.idJogo = jogoSelected.id
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        jogoSelecionado = jogos[indexPath.row]
        performSegue(withIdentifier: "detalheJogo", sender: self)
    }
}
