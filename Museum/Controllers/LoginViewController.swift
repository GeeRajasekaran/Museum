//
//  LoginViewController.swift
//  Museum
//
//  Created by CVN on 16/07/19.
//  Copyright © 2019 Agiliztech. All rights reserved.
//

import UIKit
import FirebaseAuth
import TransitionButton

class LoginViewController: UIViewController,UITextFieldDelegate {

    // MARK:- IBOutlets
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: TransitionButton!

    
    enum LoginError:Error {
        case incompleteForm
        case invalidyUserName
        case incorrectPasswordLength
    }
    
    // MARK:- View Lifecycle
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self .initialSetup()
    }
    

    // MARK:- Methods
    
    func initialSetup()  {
        
        loginBtn.cornerRadius = loginBtn.layer.frame.height / 2
        loginBtn.spinnerColor = .white
        
        Helper.sharedInstance.setRoundCornerView(aView: email, borderRadius: 16)
        Helper.sharedInstance.setRoundCornerView(aView: password, borderRadius: 16)
        email.setLeftPaddingPoints(10)
        password.setLeftPaddingPoints(10)

        self.navigationController?.navigationBar.isHidden = true
        
        email.delegate = self
        password.delegate = self
    }
    
    @IBAction func skipBtnTapped(_ sender: UIButton) {
       
        UIApplication.setRootView(ARViewController.instantiate(from: .Main))
    }
    
    // MARK:- Action methods
    
    func login() throws {
        
        let uName = email.text
        let pwd = password.text
        
        if (uName?.isEmpty)! || (pwd?.isEmpty)! {
            throw LoginError.incompleteForm
        }
    }
    
    @IBAction func signUpAction(_ button: TransitionButton) {
        
        do {
            try login()
            self .firebaseAuth()
        }
        catch LoginError.incompleteForm {
            print("Empty Fields")
        }
        catch LoginError.invalidyUserName {
            print("Empty Fields")
        }
        catch LoginError.incorrectPasswordLength {
            print("Empty Fields")
        }
        catch {
            print("Some error")
        }
        

    }
    func firebaseAuth()  {
       
        loginBtn.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            Auth.auth().createUser(withEmail: self.email.text!, password: self.password.text!){ (user, error) in
                if error == nil {
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        // 4: Stop the animation, here you have three options for the `animationStyle` property:
                        // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                        // .shake: when you want to reflect to the user that the task did not complete successfly
                        // .normal
                        self.loginBtn.stopAnimation(animationStyle: .expand, completion: {
                            let mainViewController = ARViewController.instantiate(from: .Main)
                            let navVC = UINavigationController.init(rootViewController: mainViewController)
                            let app = UIApplication.shared.delegate as? AppDelegate
                            app!.window?.rootViewController = navVC
                        })
                    })
                    
                }
                else{
                    self.loginBtn.stopAnimation()
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            
        })

    }
    
    // MARK:- Textfield delagates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField .resignFirstResponder()
        return true
    }

}
