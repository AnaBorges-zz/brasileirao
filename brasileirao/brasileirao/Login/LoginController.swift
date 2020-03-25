//
//  LoginController.swift
//  brasileirao
//
//  Created by Ana Julia on 1/23/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
        
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var labelErrorLogin: UILabel!
    
    let apiClient = APIClient()
    
    var viewModel: LoginViewModel?
    
    static var token : [LoginResponse] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel(apiClient: apiClient)
        viewModel?.delegate = self
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        viewModel?.logar(email: emailTextField.text ?? "", senha: passwordTextField.text ?? "")
    }
}

extension LoginController : LoginViewModelDelegate {
    func logar() {
        let msgErro = viewModel?.msgErro
        
        if msgErro == nil {
            performSegue(withIdentifier: "tabelaJogosSegue", sender: self)
        }
            
        else {
            labelErrorLogin.text = msgErro
            labelErrorLogin.isHidden = false
        }
        
    }
}

