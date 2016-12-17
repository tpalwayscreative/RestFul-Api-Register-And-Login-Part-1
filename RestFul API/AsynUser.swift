//
//  AsynUser.swift
//  RestFul API
//
//  Created by phong on 9/10/16.
//  Copyright © 2016 tpcreative.co. All rights reserved.
//

import UIKit

class AsynUser: NSObject {
    
    var view : AnyObject?
    var user : Struct_User?
    var userDefault : UserDefaults?
    
    init(view : AnyObject, user : Struct_User){
        
        self.view = view
        self.user = user
        self.userDefault  = UserDefaults()
    }
    
    func register() {
        
        
        let params = ["name":user!.name!,"email":user!.email!,"password":user!.password!]
        do {
            let opt = try HTTP.POST("http://tpalwayscreative.esy.es/task_manager/v1/register", parameters: params,headers: nil)
            opt.start { response in
                
                let data = response.data
                if response.error == nil {
                    let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    print("response: \(str)") //prints the HTML of the page
                    let jsonUser = JSONDecoder(data)
                    
                    if jsonUser["error"].bool
                    {
                        DispatchQueue.main.async(execute: {
                            ()-> Void in
                            IJProgressView.shared.hideProgressView()
                        }
                        )
                        print("Error")
                    }
                    else{
                        
                        DispatchQueue.main.async(execute: { () -> Void in
                            
                            
                            self.view!.performSegue(withIdentifier: "segue_to_login", sender: nil)
                            IJProgressView.shared.hideProgressView()
                            
                            print(jsonUser)
                            
                            
                        })
                    }
                }
                
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }
        
        
        
        
        
    }
    func login(){
        
        
        
        
        let params = ["email":user!.email!,"password":user!.password!]
        do {
            let opt = try HTTP.POST("http://tpalwayscreative.esy.es/task_manager/v1/login", parameters: params,headers: nil)
            opt.start { response in
                
                let data = response.data
                
                if response.error == nil {
                    let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    print("response: \(str)") //prints the HTML of the page
                    let jsonUser = JSONDecoder(data)
                    
                    
                    if jsonUser["error"].bool
                    {
                        DispatchQueue.main.async(execute: {
                            ()-> Void in
                            
                            IJProgressView.shared.hideProgressView()
                        }
                        )
                        print("Error")
                    }
                    else{
                        
                        DispatchQueue.main.async(execute: { () -> Void in
                            
                            
                            IJProgressView.shared.hideProgressView()
                            print(jsonUser)
                            
                            
                        })
                    }
                }
                
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }
        
        
        
    }
    
    
    
    
}
