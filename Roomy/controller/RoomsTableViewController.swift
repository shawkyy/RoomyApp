
//
//  RoomsTableViewController.swift
//  Roomy
//
//  Created by shawky on 7/23/19.
//  Copyright © 2019 shawky. All rights reserved.
//

import UIKit
import RealmSwift
import Kingfisher

class RoomsTableViewController: UITableViewController {
   
    @IBAction func signOutButton(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)  
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "logIn")
        self.present(nextViewController, animated:true, completion:nil)
        
        UserDefaults.standard.removeObject(forKey: "auth_token")
//
//        let realm = try! Realm()
//
//        try! realm.write {
//            realm.deleteAll()
//        }
//
    }     
    @IBOutlet weak var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       getRoomsFromRealm()
        
    }
    
   var rooms = [RoomsRealm]()
   
    
    
 
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        tableView.sectionHeaderHeight = 60
        return headerView
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return rooms.count
    }

 
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomyCell", for: indexPath) as! RoomyCell

        tableView.rowHeight = 150

        cell.roomPrice.text = rooms[indexPath.row].price
        cell.roomPlace.text = rooms[indexPath.row].place
        cell.roomTitle.text = rooms[indexPath.row].title
//        cell.firstImage.kf.setImage(  with: URL(string: rooms[indexPath.row].image),
//                                      placeholder: UIImage(named: "Logo"),
//                                      options: [
//                                        .scaleFactor(UIScreen.main.scale),
//                                        .transition(.fade(1)),
//                                        .cacheOriginalImage
//           ])
 
                return cell
    }
  

  
    
    func getRoomsFromRealm () {
        
        
        let realm = try! Realm()
        
        try! realm.write {
            
            rooms = Array(realm.objects(RoomsRealm.self))
            
        }
        
        tableView.reloadData()
    }
    
    
}
