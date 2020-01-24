//
//  ViewController.swift
//  brasileirao
//
//  Created by Ana Julia on 1/23/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var labelErrorLogin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        let email = emailTextField.text;
        let password = passwordTextField.text;
        
        if(email == "maria@g.globo" && password=="carmo"){
            performSegue(withIdentifier: "mainSegue" , sender: self)
            //exibirAlerta(messagem: "Logado");
        }
        else if(email == "" || password == ""){
            labelErrorLogin.text = "Preencha todos os campos!"
            labelErrorLogin.isHidden = false;
        }
        else{
            labelErrorLogin.text = "Usuário ou senha incorretos!"
            labelErrorLogin.isHidden = false;

        }
        

        
    }
    
    /*func exibirAlerta(messagem: String){
        let alerta = UIAlertController(title: "Alerta", message: (messagem), preferredStyle: UIAlertController.Style.alert);
    
        alerta.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil));
    
        self.present(alerta, animated: true, completion: nil);
    }*/
}

