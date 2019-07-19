//
//  UIViewController.swift
//  login
//
//  Created by Oğulcan on 20/05/2018.
//  Copyright © 2018 ogulcan. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiate(from: AppStoryboard) -> Self {
        return from.viewController(viewControllerClass: self)
    }
    
}

class Helper: NSObject {
    
    
    static let sharedInstance: Helper = {
        
        let instance = Helper()
        
        // setup code
        return instance
    }()
    // Mark Card View
    
    func setCardView(cardView : UIView)  {
        
        cardView.layer.masksToBounds = false
        cardView.layer.shadowOffset = CGSize(width: 0, height: 0);
        cardView.layer.cornerRadius = 5;
        cardView.layer.shadowRadius = 1;
        cardView.layer.shadowOpacity = 0.3;
        
    }
    
    // Round Corner View
    func setRoundCornerView(aView : UIView)  {
        
        aView.layer.masksToBounds = true
        aView.clipsToBounds = true
        aView.layer.cornerRadius = aView.frame.size.width / 2
        aView.layer.borderColor = UIColor.black.cgColor
    }
    
    
    // Round Corner View
    func setRoundCornerView(aView : UIView, borderRadius:CGFloat)  {
        
//        aView.layer.masksToBounds = true
//        aView.layer.cornerRadius = borderRadius
        
        aView.layer.borderColor = UIColor.black.cgColor
        aView.layer.cornerRadius = borderRadius
        aView.layer.borderWidth = 1.0
        
    }
    
}
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
