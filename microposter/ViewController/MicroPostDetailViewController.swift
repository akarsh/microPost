//
//  MicroPostDetailViewController.swift
//  microposter
//
//  Created by Akarsh Seggemu on 23.10.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit
import CoreData

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
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        // AppDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // context being accessed
        let context = appDelegate.persistentContainer.viewContext
        let savedPost = SavedPost(context: context)
        // a value has been set
        savedPost.content = self.content
        // adding new post to the context
        context.insert(savedPost)
        // saveContext method
        appDelegate.saveContext()
    }
}
