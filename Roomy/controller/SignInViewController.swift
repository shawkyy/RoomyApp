//
//  SignInViewController.swift
//  Roomy
//
//  Created by shawky on 7/23/19.
//  Copyright © 2019 shawky. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

//shaaawkyy@gmail.com abdalla

//abdallahshawky96@gmail.com abdalla1

//abdallahshawky966@gmail.com abdalla2





class SignInViewController: UIViewController, NVActivityIndicatorViewable{

 
    
    @IBAction func signUpButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToSignUpVC", sender: Any?.self)
        
    }
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
   
    
    @IBAction func signInButton(_ sender: UIButton) {
        
        guard let email = emailTextField.text, !email.isEmpty else {return}
        guard let password = passwordTextField.text, !password.isEmpty else {return}
      
        startAnimating()
        
        Networking.signIn(email: emailTextField.text!, Password: passwordTextField.text!) { (error:Error?,success:Bool) in
         
            
            //  3mlt hnak completion handler (7tet l closure f a5r l block fb2a asmo completion handler)
            //  1-y5osh hnak fl success
//          //  2-ydy l bool true
          //   3- hna b2olo lw l bool true a3ml ay haga .. y3ny astntgt eno d5l fl success 3n tre2 l true bool
            
            
            if success {
                
                self.performSegue(withIdentifier: "goToRoomsVC", sender: Any?.self)
            
                let userDefaults = UserDefaults.standard.object(forKey: "auth_token")
             
                Networking.getRooms(Authorization:userDefaults! as! String)
                
                self.stopAnimating()
                
            }
            
            else {
                
                let alert = Alerts()
                
                
                 self.stopAnimating()
                
              alert.signInAlert(fromController: self)
           
            }
            
        
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
