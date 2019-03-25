//
//  ViewController.swift
//  userRegistrationAndLogin
//
//  Created by MOSHIOUR on 9/24/18.
//  Copyright © 2018 moshiour. All rights reserved.
//
import Alamofire
import UIKit

class ViewController: UIViewController {
    
    let URL_USER_LOGIN = "http://127.0.0.1/userLoginRegistration/v1/login.php"
    let defaultValues = UserDefaults.standard

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    var iconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //if user is already logged in switching to profile screen
        
        //let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        //navigationItem.leftBarButtonItem = backButton
        
        
        //if defaultValues.string(forKey: "username") != nil{
            //let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            //self.navigationController?.pushViewController(profileViewController, animated: true)
            
        }
        
        
 /*
    
    @IBAction func passVisibilityButton(_ sender: Any) {
        
        if(iconClick == true)
        {
            passwordTextField.isSecureTextEntry = false
        }
        else
        {
            passwordTextField.isSecureTextEntry = true
        }
        
        iconClick = !iconClick
    }
  */
    
    
    @IBAction func signUpBack(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)

        //self.dismiss(animated: false, completion: nil)
        
    }
    
    
    @IBAction func LoginButton(_ sender: Any) {
        
        let parameters : Parameters = [
            "email" : usernameTextField.text!,
            "password" : passwordTextField.text!
        ]
        
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    
                    //if there is no error
                    if(!(jsonData.value(forKey: "error") as! Bool)){
                        
                        //getting the user from response
                        let user = jsonData.value(forKey: "user") as! NSDictionary
                        
                        //getting user values
                        let userId = user.value(forKey: "id") as! Int
                        let userName = user.value(forKey: "username") as! String
                        let userEmail = user.value(forKey: "email") as! String
                        let userPhone = user.value(forKey: "phone") as! String
                        
                        //saving user values to defaults
                        self.defaultValues.set(userId, forKey: "userid")
                        self.defaultValues.set(userName, forKey: "username")
                        self.defaultValues.set(userEmail, forKey: "useremail")
                        self.defaultValues.set(userPhone, forKey: "userphone")
                        
                        print("Successssssfuuuuullll login")
                        //self.messageLabel.text = "Successssssfuuuuullll"
                        
                        
                        
                        //switching the screen
                    if self.defaultValues.string(forKey: "useremail") != nil{
                        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
                        
                        self.navigationController?.pushViewController(profileViewController, animated: true)
                        
                        
                        
                    }
                    }
                    self.dismiss(animated: false, completion: nil)

                    }
                else{
                        //error message in case of invalid credential
                    self.messageLabel.text = "Invalid username or password"
            
                    }
                }
        }

    
    
}


    


