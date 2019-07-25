//
//  Networking.swift
//  Roomy
//
//  Created by shawky on 7/23/19.
//  Copyright © 2019 shawky. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class Networking {

    //    let signInViewController = SignInViewController()
    
    
    class func signIn (email:String, Password:String, completion: @escaping (_ error: Error?, _ success: Bool ) -> Void ) {
    
        
       let url = "https://roomy-application.herokuapp.com/auth/login"
    
       let parameters = [
            
            "email":email  ,
            "password":Password
            
        ]
    
    
        AF.request(url, method: .post, parameters: parameters)
            .validate()
            .responseJSON { (response) in

                switch response.result {
                    
                case .success(let value):
                    
                    let json = JSON(value)
                    
                    let auth_token = json["auth_token"].string
                    let def = UserDefaults.standard
                    def.set(auth_token, forKey: "auth_token")
                   
                    completion(nil,true)
                    
                case .failure(let error):
                    completion(error,false)
                    
                }
                

    }
    
    
    }
    
   
    class func signUp (name:String, email:String, Password:String, completion: @escaping (_ error: Error?, _ success: Bool ) -> Void ) {
        
        
        
        let url = "https://roomy-application.herokuapp.com/signup"
        
        let parameters = [
            
            "name":name,
            "email":email,
            "password":Password
           
            
            
        ]
        
        
        AF.request(url, method: .post, parameters: parameters)
           
            .validate()
            
            .responseJSON { (response) in
                
                switch response.result {
                    
                case .success(let value):
                    
                    let json = JSON(value)
                    
                    let auth_token = json["auth_token"].string
                    
                    let def = UserDefaults.standard
                    def.set(auth_token, forKey: "auth_token")
                    completion(nil,true)
                    
                case .failure(let error):
                    print (response)
                    completion(error,false)

        
        }
    
    
    
    
    }

  }
    //"https://roomy-application.herokuapp.com/rooms"
    //            guard let auth_token = UserDefaults.standard.object(forKey:"auth_token") else {return}
//Authorization
  
    class func getRooms (Authorization:String) {
        guard UserDefaults.standard.object(forKey:"auth_token") != nil else {return}
        
        
        
        let url = "https://roomy-application.herokuapp.com/rooms"
    
        
        let headers: HTTPHeaders = ["Authorization":Authorization]
        
        AF.request(url, method: .get, parameters: nil, headers: headers)
        
            .validate()
            .responseJSON { response  in
//                var title = [String]()
//                var price = [Int]()
//                var place = [String]()
//                var image = [String]()
//                var description = [String]()
//
                
                switch  response.result {
                    
                   
                case .success(let value):
                
                    
                    let json = JSON(value)
                    
                    var rooms = Rooms()
                
                    var number = 0
                   
                    for (_,value):(String, JSON) in json {
                        
                       rooms.title.append(value["title"].string!)
                        rooms.title.append(value["title"].string!)
                        rooms.title.append(value["title"].string!)
                        rooms.title.append(value["title"].string!)
                        
                        print(number)
                        
                         number += 1
                        
                        
                        
                        
//                        switch key {
//
//                        case json["title"].string:
//
//                        rooms.title.append(value.string!)
//
//                        print(number)
//
//                        number += 1
//
//                        default:
//
//                            print("no")
//                        }
                        
                     
                        
                    }
                    
                print("\(rooms.title[13])")
                print(rooms.title.count)
                    //    completion(nil,true)  // lw d5l fl success edy l bool true
              
                case .failure(let error):
                    
                    print(error)
                    
                  //  completion(error,false)
                }
        }
       
    }
    
   
    class func addRoom (title:String, place:String,  price:String,description:String,image:String, completion: @escaping (_ error: Error?, _ success: Bool ) -> Void ){
    
    
        let url = "https://roomy-application.herokuapp.com/rooms"
        
        let parameters = [
            
            "title":title,
            "place":place,
            "price":price,
            "description":description,
            "image":image
            
        ]
    
        AF.request(url, method: .post, parameters: parameters)
       
            .validate()
            
            .responseJSON { response in
               
                switch response.result {
                    
                case .success(let value):
                    
                    let json = JSON(value)
                    
                    let auth_token = json["auth_token"].string
                    
                    let def = UserDefaults.standard
                    def.set(auth_token, forKey: "auth_token")
                    completion(nil,true)
                    
                case .failure(let error):
                    completion(error,false)
                    
                    
                }
                
        }
    
    
    }
    
    
}
