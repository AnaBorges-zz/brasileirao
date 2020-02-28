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
    
    static var token : [LoginResponse] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        let route = AppRoute.login(login: email, password: password)
        
        if(!email.isEmpty && !password.isEmpty){
            
            apiClient.request(route: route) { (data, error) in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    let token = try JSONDecoder().decode([LoginResponse].self, from: data)
                    UserDefaults.standard.setValue(token.first?.token, forKey: "token")
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "tabelaJogosSegue", sender: self)
                    }
                } catch {
                    print(">>>>>> \(error)")
                }
            }
            
        }
        else if(email.isEmpty || password.isEmpty){
            labelErrorLogin.text = "Preencha todos os campos!"
            labelErrorLogin.isHidden = false;
        }
        else{
            labelErrorLogin.text = "Usuário ou senha incorretos!"
            labelErrorLogin.isHidden = false;
        }
        
    }
}

