

import Alamofire
import AlamofireObjectMapper
import Foundation
import RealmSwift

class GetRooms {
    class func getRoomsFromBackEnd(completionHandler: @escaping () -> Void) {
       
        if let token = UserDefaults.standard.string(forKey: "auth_token"){
        
        AF.request(RoomsRouter.getAllRooms(["Authorization" : token])).validate()
        .responseArray { (response: DataResponse<[RoomsRealm]>) in
            
            switch response.result {
                 case.success(let roomsArray):
                    
                    let realm = try! Realm()
                    try! realm.write {
                       realm.add(roomsArray)
                    }
                    completionHandler()
                 case.failure:
                        break
                
                 }
          
            }
        
        }
    }
    
    
   
    
    
    
}
