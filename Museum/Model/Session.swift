//
//  Session.swift
//  login
//
//  Created by CVN on 16/07/19.
//  Copyright © 2019 ogulcan. All rights reserved.
//

import Foundation
import UIKit

class Session: NSObject {
    
    static let sharedInstance: Session = {
        
        let instance = Session()
        
        // setup code
        
        return instance
    }()
    
    
    // MARK: - Shared Methods
    
    func setAppLaunchIsFirstTime(isLogin : Bool) {
        
        
        UserDefaults.standard.set(isLogin, forKey: "app_launch_first_time")
        userdefaultsSynchronize()
    }
    
    func IsAppLaunchFirstTime() -> Bool {
        
        if  UserDefaults.standard.object(forKey: "app_launch_first_time") == nil {
            
            return true
        }
        
        return UserDefaults.standard.bool(forKey: "app_launch_first_time")
    }
  
    // User
    
    func setIsUserLogIN(isLogin : Bool) {
        
        UserDefaults.standard.set(isLogin, forKey: "user_log_in")
        userdefaultsSynchronize()
    }
    
    func isUserLogIn() -> Bool {
        
        return UserDefaults.standard.bool(forKey: "user_log_in")
    }
    
  
    // MARK: - Private Methods
    
    private func userdefaultsSynchronize() {
        
        UserDefaults.standard.synchronize()
    }
    
}
