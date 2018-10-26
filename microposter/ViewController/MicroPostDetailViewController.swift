//
//  MicroPostDetailViewController.swift
//  microposter
//
//  Created by Akarsh Seggemu on 23.10.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class MicroPostDetailViewController: UIViewController {
    
    var content: String = ""

    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.contentLabel.text = content
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
