//
//  LoginViewController.swift
//  Museum
//
//  Created by CVN on 16/07/19.
//  Copyright © 2019 Agiliztech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK:- IBOutlets
    
    
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

}
