//
//  SignUpViewController.swift
//  Roomy
//
//  Created by shawky on 7/23/19.
//  Copyright © 2019 shawky. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class SignUpViewController: UIViewController,NVActivityIndicatorViewable {

    
    @IBAction func backButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)  // l main d ll “Main.storyBoard"
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "logIn")
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func signUpButton(_ sender: UIButton) {
        
        guard let name = emailTextField.text, !name.isEmpty else {return}
        
        guard let passwrod = passwordTextField.text, !passwrod.isEmpty else {return}
        
        
        guard let email = passwordTextField.text, !email.isEmpty else {return}
     
        
        startAnimating()
        
        Networking.signUp(name: nameTextField.text!, email: emailTextField.text!, Password: passwordTextField.text!) { error,success in
          
            if success {
             
              self.stopAnimating()
            
                self.performSegue(withIdentifier: "SignUpToRooms", sender: Any?.self)
                
            }
            else {
                
                print ("errorrrrrr")
            }
            
            
        }
        
        
        
    }
    
    
  
    
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
