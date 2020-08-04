//
//  LoginViewController.swift
//  WorldPugs
//
//  Created by Алексей Зимовец on 02.08.2020.
//  Copyright © 2020 Алексей Зимовец. All rights reserved.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {

    @IBOutlet weak var EmailUser: UITextField!
    
    @IBOutlet weak var PasswordUser: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
          
    Auth.auth().signIn(withEmail: EmailUser.text!, password: PasswordUser.text!) { (user, error) in
       if error == nil{
         self.performSegue(withIdentifier: "loginToHome", sender: self)
                      }
        else{
         let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
         let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
          alertController.addAction(defaultAction)
          self.present(alertController, animated: true, completion: nil)
             }
    }
            
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
