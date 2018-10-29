//
//  SignUpViewController.swift
//  microposter
//
//  Created by Akarsh Seggemu on 29.10.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //    This function posts the username and password to the users page
    func signUpUser(username: String, password: String) {
        if let url = URL(string: "https://micropostr-app.herokuapp.com/users") {
            // URLSession takes the configuration - ephemeral
            let session = URLSession(configuration: .ephemeral)
            // URLRequest
            var request = URLRequest(url: url)
            // POST method
            request.httpMethod = "POST"
            // Adding value for the header field
            // The headers have the key as "Content-Type" and its value as "application/json"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            // swift object dictionary points towards the object
            let loginDictionary = ["username": username, "password": password]
            
            do {
                // 
                let loginData = try JSONSerialization.data(withJSONObject: loginDictionary, options: [])
                
                request.httpBody = loginData
            } catch {
                
            }
            // a dataTask with URLRequest is created
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if let jsonData = data {
                    do {
                        let responseJSON = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String:String]
                        print(responseJSON)
                    } catch {
                        
                    }
                }
            }
            // start the dataTask by calling its method
            dataTask.resume()
        }
    }
    
    // We are passing the text field values of username and password to the function singUpUser
    @IBAction func signUpButtonPressed(_ sender: Any) {
        self.signUpUser(username: usernameTextField.text!, password: passwordTextField.text!)
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
