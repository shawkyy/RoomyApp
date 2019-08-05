//
//  StartViewController.swift
//  Roomy
//
//  Created by shawky on 7/23/19.
//  Copyright © 2019 shawky. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UserDefaults.standard.object(forKey: "auth_token") != nil) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.performSegue(withIdentifier: "startToRooms", sender: self)
        })
        }
    
        else {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.performSegue(withIdentifier: "startToSignIn", sender: self)
            })
      }
    }
  }

