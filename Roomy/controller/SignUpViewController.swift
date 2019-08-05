//
//  SignUpViewController.swift
//  Roomy
//
//  Created by shawky on 7/23/19.
//  Copyright © 2019 shawky. All rights reserved.


import UIKit
import NVActivityIndicatorView
import Alamofire

class SignUpViewController: UIViewController,NVActivityIndicatorViewable {
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    
    @IBAction private func signUpButton(_ sender: UIButton) {
        
        guard let name = emailTextField.text, !name.isEmpty else {return}
        guard let passwrod = passwordTextField.text, !passwrod.isEmpty else {return}
        guard let email = passwordTextField.text, !email.isEmpty else {return}
        
        startAnimating()
        
        AF.request(RoomsRouter.signUp(["name": nameTextField.text!, "email": emailTextField.text!, "Password": passwordTextField.text!]))
            .validate()
            .response { (response) in
        switch response.result {
              case .success:
                   self.performSegue(withIdentifier: "SignUpToRooms", sender: Any?.self)
                   self.stopAnimating()
                    
              case .failure:
                    break
           }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "logIn")
        self.present(nextViewController, animated:true, completion:nil)
    }
}
