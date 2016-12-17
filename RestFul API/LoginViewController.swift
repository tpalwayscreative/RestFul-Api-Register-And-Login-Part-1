//
//  LoginViewController.swift
//  RestFul API
//
//  Created by phong on 9/10/16.
//  Copyright © 2016 tpcreative.co. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldemail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func btnBack(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: "segue_to_register", sender: nil)
        
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        
        var user : Struct_User = Struct_User()
        user.email = textFieldemail.text
        user.password = textFieldPassword.text
        
        if textFieldemail.text != "" && textFieldemail.text != ""{
            
            IJProgressView.shared.showProgressView(view)
            let syn = AsynUser(view: self,user: user)
            syn.login()
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
