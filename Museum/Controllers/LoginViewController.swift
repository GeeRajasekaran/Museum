//
//  LoginViewController.swift
//  Museum
//
//  Created by CVN on 16/07/19.
//  Copyright © 2019 Agiliztech. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    // MARK:- IBOutlets
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    // MARK:- View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self .initialSetup()
    }
    

    // MARK:- Methods
    
    func initialSetup()  {
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func skipBtnTapped(_ sender: UIButton) {
       
        UIApplication.setRootView(ARViewController.instantiate(from: .Main))
    }
    
    // MARK:- Action methods
    
    @IBAction func signUpAction(_ sender: Any) {
        
       
            Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
                if error == nil {
                    let mainViewController = ARViewController.instantiate(from: .Main)
                    let navVC = UINavigationController.init(rootViewController: mainViewController)
                    var app = UIApplication.shared.delegate as? AppDelegate
                    app!.window?.rootViewController = navVC
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }

}
