
import Alamofire
import UIKit
import NVActivityIndicatorView
import SwiftyJSON

class SignInViewController: UIViewController, NVActivityIndicatorViewable{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func signInButton(_ sender: UIButton) {
        
        guard let email = emailTextField.text, !email.isEmpty else {return}
        guard let password = passwordTextField.text, !password.isEmpty else {return}
        
        startAnimating()
        
        AF.request(RoomsRouter.signIn(["email" : emailTextField.text!, "password":passwordTextField.text!]))
            .validate()
            .response { (response) in
        switch response.result {
                case .success(let value):
                    let json = JSON(value as Any)
                    let auth_token = json["auth_token"].string
                    let userDefaults = UserDefaults.standard
                    userDefaults.set(auth_token, forKey: "auth_token")
                    
                    self.stopAnimating()
                    self.performSegue(withIdentifier: "goToRoomsVC", sender: Any?.self)
                
                case .failure:
                    Alerts.signInAlert(fromController: self)
                    self.stopAnimating()
            }
        }
    }
   
    @IBAction func signUpButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToSignUpVC", sender: Any?.self)
    }
}
