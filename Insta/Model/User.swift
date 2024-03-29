//
//  User.swift
//  Insta
//
//  Created by 황원상 on 2022/11/12.
//

import Foundation
import Firebase
import FirebaseAuth

struct User{
    let email:String
    let fullname:String
    let profileImageURL:String
    let username:String
    let uid:String
    
    var isFollowed = false
    
    var stats:UserStats!
    
    var isCurrentUser:Bool {
        return Auth.auth().currentUser?.uid == uid
    }
    
    init(dictionary:[String:Any]){
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        
        self.stats = UserStats(followers: 0, following: 0,posts: 0)
    }
}

struct UserStats {
    let followers:Int
    let following:Int
    let posts:Int
}
