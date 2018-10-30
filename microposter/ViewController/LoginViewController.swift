//
//  LoginViewController.swift
//  microposter
//
//  Created by Akarsh Seggemu on 29.10.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func loginInUser(username: String, password: String) {
        if let url = URL(string: "https://micropostr-app.herokuapp.com/users/login") {
            var request = URLRequest(url: url)
            let session = URLSession(configuration: .ephemeral)
            request.httpMethod = "POST"
            // loginString that has username and password
            let loginString = "\(username):\(password)"
            //character encoding format utf8
            if let loginData = loginString.data(using: .utf8) {
                // encoding loginData in base64
                let authString = loginData.base64EncodedString()
                // Adding values to the headers
                // key as "Authorization" and value as "Basic encoded-base64-String" for basic authorization
                request.addValue("Basic \(authString)", forHTTPHeaderField: "Authorization")
            }
            // dataTask is created
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if let jsonData = data {
                    // do try catch block
                    do {
                        let responseJSON = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String:Any]
                        if let token = responseJSON["token"] as? String {
                            // storing the token in database
                            UserDefaults.standard.set(token, forKey: "token")
                            DispatchQueue.main.async {
                                SwitchUtility.updateViewController()
                            }
                        }
                    } catch {
                        
                    }
                }
            }
            // dataTask is called
            dataTask.resume()
            
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.loginInUser(username: usernameTextField.text!, password: passwordTextField.text!)
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
