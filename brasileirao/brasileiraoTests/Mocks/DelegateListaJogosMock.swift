//
//  DelegateMock.swift
//  brasileiraoTests
//
//  Created by Ana Julia on 3/19/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation
@testable import brasileirao

class DelegateListaJogosMock : ListaJogosViewModelDelegate{

    var _rodadaAlterada : (() -> Void)?
    func rodadaAlterada() {
        _rodadaAlterada?()
    }
}
