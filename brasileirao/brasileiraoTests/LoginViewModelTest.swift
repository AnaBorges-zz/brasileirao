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
    
    var sut : LoginViewModelProtocol!
    
    override func setUp() {
        super.setUp()
        
        let apiClient = APIClientMock()
        sut = LoginViewModel(apiClient: apiClient)
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
    
}
