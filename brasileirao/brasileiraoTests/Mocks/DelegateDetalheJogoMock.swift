//
//  DelegateDetalheJogoMock.swift
//  brasileiraoTests
//
//  Created by Ana Julia on 3/23/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation
@testable import brasileirao

class DelegateDetalheJogoMock: DetalheJogoViewModelDelegate{
    
    var _mostrarFichaJogo : (() -> Void)?
    var _mostrarLancesJogo : (() -> Void)?
    var _exibirErro : ((_ msg:String) -> Void)?

    func mostrarFichaJogo() {
        _mostrarFichaJogo?()
    }
    
    func mostrarLanceALance() {
        _mostrarLancesJogo?()
    }
    
    func exibirErro(msg: String) {
        _exibirErro?(msg)
    }
    
    
}


