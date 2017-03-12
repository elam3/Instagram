//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Edison Lam on 3/11/17.
//  Copyright © 2017 Edison Lam. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogOutBtnPressed(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            if (error != nil) {
                print("Log Out Error: \(error?.localizedDescription)")
            }
        }
        self.performSegue(withIdentifier: "segueFromProfileToLogin", sender: nil)
        
        // TODO
        //NotificationCenter.default.post(name: NSNotification.Name(rawValue: User.userDidLogoutNotification), object: nil)
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
