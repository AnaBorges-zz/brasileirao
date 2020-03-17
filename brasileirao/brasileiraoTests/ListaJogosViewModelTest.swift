//
//  ListaJogosViewModelTest.swift
//  brasileiraoTests
//
//  Created by Ana Julia on 3/16/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import XCTest
@testable import brasileirao

class ListaJogosViewModelTest : XCTestCase {
    var sut: ListaJogosViewModel!
    
    override func setUp() {
        super.setUp()
        
        let apiClient = APIClientMock()
        sut = ListaJogosViewModel(apiClient: apiClient)
    }
    
    override func tearDown() {
        //Algo
    }
    
    func testProximaRodada(){
        sut.rodada = 1
        sut.proximaRodada()
        XCTAssertEqual(sut.rodada, 2)
    }
    
    func testRodadaAnterior(){
        sut.rodada = 2
        sut.rodadaAnterior()
        XCTAssertEqual(sut.rodada, 1)
    }
    
    func testVoltarDesabilitado(){
        sut.rodada = 1
        XCTAssertEqual(sut.exibeVoltar, false)
    }
    
    func testAvancarDesabilitado(){
        sut.rodada = 3
        XCTAssertEqual(sut.exibeAvancar, false)
    }
    
//  perguntar se é necessário
//    func testAvancarHabilitado(){
//        sut.rodada = 1
//        XCTAssertEqual(sut.exibeAvancar, true)
//    }
//    func testVoltarHabilitado(){
//           sut.rodada = 2
//           XCTAssertEqual(sut.exibeVoltar, true)
//       }
    
    
}
