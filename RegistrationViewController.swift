//
//  RegistrationViewController.swift
//  userRegistrationAndLogin
//
//  Created by MOSHIOUR on 9/24/18.
//  Copyright © 2018 moshiour. All rights reserved.
//
import Alamofire
import UIKit

class RegistrationViewController: UIViewController {
    
    let URL_USER_REGISTER = "http://127.0.0.1/userLoginRegistration/v1/register.php"
    
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        let parameters: Parameters = [
        
            "username" : userNameTextField.text!,
            "password" : passwordTextField.text!,
            "email" : emailTextField.text!,
            "phone" : phoneNumberTextField.text!
        ]
        
        //send http request
        
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value
                {
                    // converting t as dictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in the label
                    //self.responseLabel.text = jsonData.value(forKey : "message") as! String?
                    let al = jsonData.value(forKey : "message") as! String?
                    
                    if al == "User created successfully"
                        
                    {
                        let alert = UIAlertController(title: "Success", message: "You have Successfully created your account, lease log in to continue ", preferredStyle: .alert)
                        
                        let loginAction = UIAlertAction(title: "login", style: .default, handler: {_ -> Void in
                            
                            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                            
                            self.present(nextViewController, animated: true, completion: nil)
                            
                        })
                        
                        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                        alert.addAction(loginAction)
                        alert.addAction(cancelAction)
                        self.present(alert, animated: true){}
                    }
                    else if (al == "User already exist")
                    {
                        let alert = UIAlertController(title: "Failed", message: "User Already Exist, Please Enter a valid username and Email address. ", preferredStyle: .alert)
                        
                        let signupAction = UIAlertAction(title: "Signup", style: .default, handler:nil)
                        alert.addAction(signupAction)

                        self.present(alert, animated: true){}
                    }
                    
                    else
                    {
                        let alert = UIAlertController(title: "Failed", message: "Some error occurred , Please sign up again", preferredStyle: .alert)
                        
                        let signupAction = UIAlertAction(title: "Signup", style: .default, handler: nil)
                        alert.addAction(signupAction)
                        
                        self.present(alert, animated: true){}
                    }
                    
                    
                }
                
                
            }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}


