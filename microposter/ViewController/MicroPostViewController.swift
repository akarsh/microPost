//
//  MicroPostViewController.swift
//  microposter
//
//  Created by Akarsh Seggemu on 22.10.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class MicroPostViewController: UITableViewController {


    @IBOutlet var microTableView: UITableView!
    
    var posts = [["author": "akarsh", "content": "first post"], ["author": "seggemu", "content": "second post"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.microTableView.dataSource = self
        self.microTableView.delegate = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "microPostCell", for: indexPath)
        as! MicroPostViewCell
        
        let posts = self.posts[indexPath.row]
        
        if let content = posts["content"], let author = posts["author"] {
            cell.authorLabel.text = author
            cell.titleLabel.text = content
        }

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "microPostDetail" {
            if let destination = segue.destination as? MicroPostDetailViewController {
                if let indexPath = self.microTableView.indexPathForSelectedRow {
                    let post = self.posts[indexPath.row]
                    
                    destination.post = post
                }
            }
        }
    }
    
}
