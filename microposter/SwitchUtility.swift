//
//  SwitchUtility.swift
//  microposter
//
//  Created by Akarsh Seggemu on 29.10.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import Foundation
import UIKit

class SwitchUtility {
    // Based on the states it will switch
    static func updateViewController() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        var rootViewController: UIViewController
        if let token = UserDefaults.standard.string(forKey: "token") {
            rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBarViewController")
        } else {
            rootViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "loginViewController")
        }
        appDelegate.window?.rootViewController = rootViewController
    }
}
