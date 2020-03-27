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
    var apiClientMock: APIClientMock!
    
    var sut: ListaJogosViewModel!
    
    override func setUp() {
        super.setUp()
        
        apiClientMock = APIClientMock()
        sut = ListaJogosViewModel(apiClient: apiClientMock)
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
    
    func testProximaRodadaChamaAPIClientComARotaCerta() {
        var routeRecebida: AppRoute?
        
        apiClientMock._request = { route, completion in
            routeRecebida = route
        }
        
        sut.rodada = 1
        sut.proximaRodada()
        
        XCTAssertEqual(routeRecebida, AppRoute.jogos(rodada: 2))
    }
    
    func testProximaRodadaChamaDelegateSeDecodificarJogos(){
        let delegateMock = DelegateListaJogosMock()
        
        //var rodadaAlteradaExpectation = expectation(description: "Rodada alterada foi chamada")
        
        var rodadaFoiAlterada = false
        
        sut.delegate = delegateMock
        
        apiClientMock._request = { route, completion in
            completion(MockJson.jogosJson(), nil)
        }
        
        delegateMock._rodadaAlterada = {
            //rodadaAlteradaExpectation.fulfill()
            rodadaFoiAlterada = true
        }
        
        sut.rodada = 1
        sut.proximaRodada()
        
        //wait(for: [rodadaAlteradaExpectation], timeout: 1)
        XCTAssertTrue(rodadaFoiAlterada)
        
    }
    
}
