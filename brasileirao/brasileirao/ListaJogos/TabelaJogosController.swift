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
    
    var viewModel: ListaJogosViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ListaJogosViewModel(apiClient: apiClient)
        viewModel?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.rodadaInicial()
        
    }
    
    @IBAction func proximaRodada(_ sender: UIBarButtonItem) {
        viewModel?.proximaRodada()
    }

    @IBAction func rodadaAnterior(_ sender: UIBarButtonItem) {
        viewModel?.rodadaAnterior()
    }
    
    func mudarRodada(rodada: Int){
        rodadasBar.leftBarButtonItem?.isEnabled = rodada > 1
        rodadasBar.rightBarButtonItem?.isEnabled = rodada < 3
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.jogos.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellJogo", for: indexPath) as? JogosTableViewCell,
            let jogo = viewModel?.jogos[indexPath.row]
        else {
            return UITableViewCell()
        }
        
        cell.prepare(with: jogo)
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "detalheJogo"{
            
            guard
                let destination = segue.destination as? DetalheJogoController,
                let jogoSelected = viewModel?.jogoSelecionado
            else {
                return
            }

            destination.jogoSelecionado = jogoSelected
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selecionaJogo(index: indexPath.row)
        performSegue(withIdentifier: "detalheJogo", sender: self)
    }
}

extension TabelaJogosController: ListaJogosViewModelDelegate {
    func rodadaAlterada() {
        
        rodadasBar.title = viewModel?.titulo

        rodadasBar.leftBarButtonItem?.isEnabled = viewModel?.exibeVoltar ?? false
        rodadasBar.rightBarButtonItem?.isEnabled = viewModel?.exibeAvancar ?? false
        
        tableView.reloadData()
    }
}
