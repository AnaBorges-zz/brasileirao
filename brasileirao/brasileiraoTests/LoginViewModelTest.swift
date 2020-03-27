//
//  LoginViewModelTest.swift
//  brasileiraoTests
//
//  Created by Ana Julia on 3/13/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import XCTest
@testable import brasileirao

class LoginViewModelTest: XCTestCase {
    var apiClientMock : APIClientMock!
    var sut : LoginViewModel!
    
    override func setUp() {
        super.setUp()
        
        apiClientMock = APIClientMock()
        sut = LoginViewModel(apiClient: apiClientMock)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCamposEmBranco() {
        sut.logar(email: "", senha: "")
        XCTAssertEqual(sut.msgErro, "Preencha todos os campos!")
    }
    
    func testEmailEmBranco() {
        sut.logar(email: "", senha: "xxxx")
        XCTAssertEqual(sut.msgErro, "Preencha todos os campos!")
    }
    
    func testSenhaEmBranco() {
        sut.logar(email: "xxxx", senha: "")
        XCTAssertEqual(sut.msgErro, "Preencha todos os campos!")
    }

    func testLoginSucess() {
        sut.logar(email: "xxxx", senha: "yyy")
        XCTAssertNil(sut.msgErro)
    }
    
    func testLogarChamadaAPIClientComARotaCerta(){
        var routeRecebida: AppRoute?
        
        apiClientMock._request = {route, completion in
            routeRecebida = route
        }
        
        sut.logar(email: "xxx", senha: "000")
        
        XCTAssertEqual(routeRecebida, AppRoute.login(login: "xxx", password: "000"))
    }
    
    func testLogarChamaDelegateLogar(){
        let delegateMock = DelegateLoginMock()
        
        var logado = false
        
        sut.delegate = delegateMock
        
        apiClientMock._request = {route, completion in
            completion(MockJson.loginJson(),nil)
        }
        
        delegateMock._logar = {
            logado = true
        }
        
        sut.logar(email: "xxx", senha: "000")
    }
    
}
