//
//  User.swift
//  RestFul API
//
//  Created by phong on 9/10/16.
//  Copyright © 2016 tpcreative.co. All rights reserved.
//

import UIKit


struct Struct_User {
    var name : String?
    var email : String?
    var password : String?
    
    
    init(){
        
    }
    init(user : Struct_User)
    {
        self.name = user.name
        self.email = user.email
        self.password = user.password
    }
    
}


class User: NSObject {

}
