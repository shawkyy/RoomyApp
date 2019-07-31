//
//  Alerts.swift
//  Roomy
//
//  Created by shawky on 7/24/19.
//  Copyright © 2019 shawky. All rights reserved.
//

import UIKit


class Alerts:UIViewController {
    
    
  class func signInAlert (fromController controller: UIViewController) {
        
        
        let alert = UIAlertController(title: "", message: "incorrect email or password", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    
        controller.present(alert, animated: true, completion: nil)
    
    }
    
    
    
}
