//
//  ViewController.swift
//  RestFul API
//
//  Created by phong on 9/10/16.
//  Copyright © 2016 tpcreative.co. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFileldName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segue_to_login", sender: nil)
        
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        
        
        var user : Struct_User = Struct_User()
        user.name = textFileldName.text
        user.email = textFieldEmail.text
        user.password = textFieldPassword.text
        
        if textFileldName.text != "" && textFieldEmail.text != "" && textFieldPassword.text != "" {
            IJProgressView.shared.showProgressView(view)
            let syn = AsynUser(view: self,user: user)
            syn.register()
            
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

