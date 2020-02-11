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
    
    static var token : [LoginResponse] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        let email = emailTextField.text;
        let password = passwordTextField.text;
        
        if(email != "" && password != ""){

            Requisitions.loginAutentication(user: email!, password: password!, onComplete: {(token) in
                LoginController.token = token
                    
            })
            performSegue(withIdentifier: "tabelaJogosSegue", sender: self)
        }
        else if(email!.isEmpty || password!.isEmpty){
            labelErrorLogin.text = "Preencha todos os campos!"
            labelErrorLogin.isHidden = false;
        }
        else{
            labelErrorLogin.text = "Usuário ou senha incorretos!"
            labelErrorLogin.isHidden = false;

        }
        

        
    }
}

