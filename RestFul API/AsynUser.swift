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
    init(view : AnyObject, user : Struct_User){
        
        self.view = view
        self.user = user
    }

    func register() {
        
        
        //let api_key : String = userDefault.valueForKey(Config.TAG_API_KEY) as! String
        let request = HTTPTask()
        //request.requestSerializer = HTTPRequestSerializer()
       // request.requestSerializer.headers[Config.TAG_AUTHORIZATION] = api_key
        let params = ["name":user!.name!,"email":user!.email!,"password":user!.password!]
   
        request.POST("http://tpalwayscreative.esy.es/task_manager/v1/register" , parameters: params, completionHandler:
            {(response: HTTPResponse) in
                
                if let data = response.responseObject as? NSData {
                    let str = NSString(data: data, encoding: NSUTF8StringEncoding)
                    print("response: \(str)") //prints the HTML of the page
                    let jsonUser = JSONDecoder(data)
                    if jsonUser["error"].bool
                    {
                        dispatch_async(dispatch_get_main_queue(),
                            {
                                ()-> Void in
                                
                                
                                print(jsonUser)
                                IJProgressView.shared.hideProgressView()
                                
                            }
                        )
                        print("Error")
                    }
                    else{
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            
                            self.view!.performSegueWithIdentifier("segue_to_login", sender: nil)
                            IJProgressView.shared.hideProgressView()
                            
                            print(jsonUser)
                            
                        })
                    }
                }
        })

    
        
    }
    func login(){
        
        
        //let api_key : String = userDefault.valueForKey(Config.TAG_API_KEY) as! String
        let request = HTTPTask()
        //request.requestSerializer = HTTPRequestSerializer()
        // request.requestSerializer.headers[Config.TAG_AUTHORIZATION] = api_key
        let params = ["email":user!.email!,"password":user!.password!]
        
        request.POST("http://tpalwayscreative.esy.es/task_manager/v1/login" , parameters: params, completionHandler:
            {(response: HTTPResponse) in
                
                if let data = response.responseObject as? NSData {
                    let str = NSString(data: data, encoding: NSUTF8StringEncoding)
                    print("response: \(str)") //prints the HTML of the page
                    let jsonUser = JSONDecoder(data)
                    if jsonUser["error"].bool
                    {
                        dispatch_async(dispatch_get_main_queue(),
                            {
                                ()-> Void in
                                
                                
                                print(jsonUser)
                                IJProgressView.shared.hideProgressView()
                                
                            }
                        )
                        print("Error")
                    }
                    else{
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            
                            IJProgressView.shared.hideProgressView()
                            print(jsonUser)
                            
                        })
                    }
                }
        })

        
        
        
        
    }
    
    
    

}
