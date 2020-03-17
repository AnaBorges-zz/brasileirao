//
//  ListaJogosViewModel.swift
//  brasileirao
//
//  Created by Ana Julia on 3/10/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation

protocol ListaJogosViewModelProtocol: class{
    var titulo : String? { get }
    var jogos : [JogoModel] { get }
    var rodada: Int { get }
    var jogoSelecionado: JogoModel? { get }
    func proximaRodada()
    func rodadaAnterior()
    func selecionaJogo(index: Int)
    init(apiClient: APIClientProtocol)
}

protocol ListaJogosViewModelDelegate: class {
    func rodadaAlterada()
}

class ListaJogosViewModel : ListaJogosViewModelProtocol{
    
    var jogos: [JogoModel] = []
    var rodada: Int = 0
    var jogoSelecionado: JogoModel?
    var titulo: String?
    var exibeVoltar: Bool = false
    var exibeAvancar: Bool = false
    
    private let apiClient: APIClientProtocol
    
    weak var delegate : ListaJogosViewModelDelegate?
    
    required init(apiClient: APIClientProtocol){
        self.apiClient = apiClient
    }
    
    func selecionaJogo(index: Int) {
        jogoSelecionado = jogos[index]
    }
    
    func rodadaInicial(){
        rodada = 1
        mostrarRodada(rodada: rodada)
    }
    
    func proximaRodada() {
        rodada+=1
        mostrarRodada(rodada: rodada)
    }
    
    func rodadaAnterior() {
        rodada-=1
        mostrarRodada(rodada: rodada)
    }
    
    private func mostrarRodada(rodada: Int){
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
                            self.configuraNavigation()
                            self.delegate?.rodadaAlterada()
                       }
                   }
                   catch{
                       print(error)
                   }
                }
        }
    
        func configuraNavigation(){
            titulo = "\(rodada)º rodada"
            exibeVoltar = rodada > 1
            exibeAvancar = rodada < 3
        }
    }

