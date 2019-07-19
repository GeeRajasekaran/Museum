//
//  SplashVC.swift
//  Repo
//
//  Created by CVN on 05/06/18.
//  Copyright © 2018 CVN. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    
    @IBOutlet weak var splashImageView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        animateSplashImage()
    }
    
    func animateSplashImage(){
        UIView.animate(withDuration: 1.0, animations: {
            self.splashImageView.alpha = 1
            self.splashImageView.layer.cornerRadius = 5
            
            // Here we can grab the AppIcon image from bundle.
            // But that should be pixelate while zooming in iPhone X.
            // So i am using .pdf as image file for better filesize.
            //self.splashImageView.image = #imageLiteral(resourceName: "splashImage")
             self.splashImageView.image = #imageLiteral(resourceName: "Asset 1")// #imageLiteral(resourceName: "symbol")
            
        }) { (isAlphaCompleted) in
            UIView.animate(withDuration: 2.0, animations: {
                self.splashImageView.backgroundColor = UIColor.clear
                self.splashImageView.transform = CGAffineTransform(scaleX: 10, y: 10)
            }, completion: { (isTransformCompleted) in
                self.perform(#selector(self.showLogin), with: nil, afterDelay: 1.0)
            })
        }
    }
    
    @objc func showLogin(){
        
        var appDelegate = UIApplication.shared.delegate as? AppDelegate
        if SESSION.IsAppLaunchFirstTime() {
            // Show home page
            let mainViewController = ARViewController.instantiate(from: .Main)
            let navVC = UINavigationController.init(rootViewController: mainViewController)
            appDelegate!.window?.rootViewController = navVC
        } else {
            // Show login page
            let loginViewController = LoginViewController.instantiate(from: .Main)
            SESSION.setAppLaunchIsFirstTime(isLogin: false)
            appDelegate!.window?.rootViewController = loginViewController
        }
        
        
    }


}
