//
//  SignUpViewController.swift
//  WorldPugs
//
//  Created by Алексей Зимовец on 02.08.2020.
//  Copyright © 2020 Алексей Зимовец. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var EmailUserRegistration: UITextField!
    @IBOutlet weak var PasswordUserRegistration: UITextField!

    @IBOutlet weak var ConfirmPasswordUser: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpAction(_ sender: Any) {
        
    if PasswordUserRegistration.text != ConfirmPasswordUser.text {
        
    let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alertController.addAction(defaultAction)
    self.present(alertController, animated: true, completion: nil)
            }
    else{
    Auth.auth().createUser(withEmail: EmailUserRegistration.text!, password: PasswordUserRegistration.text!){ (user, error) in
     if error == nil {
        self.performSegue(withIdentifier: "regSegue", sender: self)
        } else {
        
        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
           }
                }
          }
    }

    @IBAction func SingInAction(_ sender: Any) {
        signUpAction(sender)
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
