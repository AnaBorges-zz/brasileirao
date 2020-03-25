//
//  DetalheJogoViewModelTest.swift
//  brasileiraoTests
//
//  Created by Ana Julia on 3/20/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import XCTest
@testable import brasileirao

class DetalheJogoViewModelTest: XCTestCase{
    var apiClientMock: APIClientMock!
    var jogoSelecionado: JogoModel!
    
    var sut: DetalheJogoViewModel!
    
    override func setUp() {
        let timeCasa = Time(nome: "Flamengo",sigla: "Fla",
                            urlEscudo:"https://s.glbimg.com/es/sde/f/organizacoes/2018/04/09/Flamengo-65.png",
                            gols: 3);
        
        let timeVisitante = Time(nome: "Cruzeiro", sigla: "CRU",
                                 urlEscudo: "https://s.glbimg.com/es/sde/f/organizacoes/2015/04/29/cruzeiro_65.png",
                                 gols: 1)
        
        jogoSelecionado = JogoModel(id: 2, data: "2019-04-29T16:00:00.000Z", local: "Maracanã",
                                     timeCasa: timeCasa, timeVisitante: timeVisitante)
        
        apiClientMock = APIClientMock()
        sut = DetalheJogoViewModel(apiClient: apiClientMock, jogo: jogoSelecionado)
    }
    
    func testeConsultaFichaChamadaAPIClientComARotaCerta(){
        var routeRecebida: AppRoute?
        
        apiClientMock._request = {route, completion in
            routeRecebida = route
        }
        
        sut.consultaFicha()
        
        XCTAssertEqual(routeRecebida, AppRoute.ficha(jogo: jogoSelecionado.id))
    }
    
    func testeConsultaLancesChamadaAPIClentComARotaCerta(){
        var routeRecebida: AppRoute?
        
        apiClientMock._request = {route, completin in
            routeRecebida = route
        }
        
        sut.consultaFicha()
        
        XCTAssertEqual(routeRecebida, AppRoute.ficha(jogo: jogoSelecionado.id))
    }
    
    func testConsultaFichaChamaDelegateSeDecodificarJogo(){
        let delegateMock = DelegateDetalheJogoMock()

        var fichaMostrada = false

        sut.delegate = delegateMock

        apiClientMock._request = { route, completion in
            completion(MockJson.jogoSelecionadoJson(), nil)
        }

        delegateMock._mostrarFichaJogo = {
            fichaMostrada = true
        }

        sut.consultaFicha()

        XCTAssertTrue(fichaMostrada)
    }
    
//    func testConsultaLancesChamaDelegateSeDecodificarLances(){
//        let delegateMock = DelegateDetalheJogoMock()
//
//        var lancesMostrados = false
//
//        sut.delegate = delegateMock
//
//        apiClientMock._request = {route, completion in
//            completion(MockJson.lancesJogoSelecionadoJson(), nil)
//        }
//
//        delegateMock._mostarFichaJogo = {
//            lancesMostrados = true
//        }
//
//        sut.consultaLances()
//
//        XCTAssert(lancesMostrados)
//    }
    
}
