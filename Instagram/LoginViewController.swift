//
//  LoginViewController.swift
//  Instagram
//
//  Created by Edison Lam on 3/7/17.
//  Copyright © 2017 Edison Lam. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onSignInBtnPressed(_ sender: Any) {
        let username:String = self.userNameTextField.text ?? ""
        let password:String = self.passwordTextField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if user != nil {
                print("We have logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Log In Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onSignUpBtnPressed(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = self.userNameTextField.text!
        newUser.password = self.passwordTextField.text!
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("Successfully created a user!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("SignUp Error: \(error?.localizedDescription)")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
