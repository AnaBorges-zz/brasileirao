//
//  LoginViewModel.swift
//  brasileirao
//
//  Created by Ana Julia on 3/10/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation

protocol LoginViewModelProtocol: class {
    var email: String? { get }
    var senha: String? { get }
    var msgErro: String? { get }
    func logar(email: String, senha: String)
    init(apiClient: APIClientProtocol)
}

protocol LoginViewModelDelegate: class {
    func logado()
}

class LoginViewModel : LoginViewModelProtocol{
    
    private let apiClient : APIClientProtocol
    
    weak var delegate: LoginViewModelDelegate?
    
    var email : String?
    var senha : String?
    var msgErro: String?
    
    required init(apiClient: APIClientProtocol){
        self.apiClient = apiClient
    }
    
    func logar(email:String, senha:String){
                    
            if(email != "" && senha != ""){
                loginRequest(email, senha)
            }
            else {
                msgErro = "Preencha todos os campos!"
                self.delegate?.logado()

            }
        }
    
    func loginRequest (_ email:String, _ senha:String){
        let route = AppRoute.login(login: email, password: senha)

        apiClient.request(route: route) { (data, error) in
            if let error = error {
                print(error)
                
                if error == APIError.notFound {
                    DispatchQueue.main.async {
                        self.msgErro = "Usuário ou senha incorretos!"
                        self.delegate?.logado()
                    }
                }
                
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let token = try JSONDecoder().decode([LoginResponse].self, from: data)
                UserDefaults.standard.setValue(token.first?.token, forKey: "token")
                DispatchQueue.main.async {
                    self.msgErro = nil
                    self.delegate?.logado()
                }
            } catch {
                print(error)
            }
        }
    }
        
}

