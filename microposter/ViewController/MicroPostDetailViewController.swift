//
//  MicroPostDetailViewController.swift
//  microposter
//
//  Created by Akarsh Seggemu on 23.10.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class MicroPostDetailViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    
    // empty dictionary
    var post: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let content = post["content"] {
            self.contentLabel.text = content
        }
    }

}
