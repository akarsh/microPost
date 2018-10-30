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
    
    var posts = [post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.microTableView.dataSource = self
        //        self.microTableView.delegate = self

        // calling the fetch posts method
        self.fetchPosts { (posts) in
            print(posts)
            self.posts = posts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        // calling the fetch user posts method
//        self.fetchUserPosts { (posts) in
//            print(posts)
//            self.posts = posts
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
    }
    
    // Fetching User posts
    func fetchUserPosts(completionHandler: @escaping ([post]) -> ()) {
        let url = "https://micropostr-app.herokuapp.com/users/posts"
        if let urlString = URL(string: url) {
            let session = URLSession(configuration: .ephemeral)
            var request = URLRequest(url: urlString)
            if let token = UserDefaults.standard.string(forKey: "token") {
                request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                let dataTask = session.dataTask(with: request) { (data, response, error) in
                    if let jsonData = data {
                        let decoder = JSONDecoder()
                        do {
                            let posts = try decoder.decode([post].self, from: jsonData)
                            completionHandler(posts)
                        } catch {
                            
                        }
                    }
                }
                dataTask.resume()
            }
        }
    }
    
//    We are using escaping because the value needs to be escaping while it is in an other closure
    func fetchPosts(completionHandler: @escaping ([post]) -> ()) {
        let url = "https://micropostr-app.herokuapp.com/posts"
        if let urlString = URL(string: url) {
            let session = URLSession(configuration: .ephemeral)
            let dataTask = session.dataTask(with: urlString) { (data, response, error) in
                if let jsonData = data {
                    let decoder = JSONDecoder()
                    do {
                        let posts = try decoder.decode([post].self, from: jsonData)
                        completionHandler(posts)
                    } catch {
                        
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "microPostCell", for: indexPath)
            as! MicroPostViewCell
        
        let post = posts[indexPath.row]
        cell.authorLabel.text = "\(post.authorID)"
        cell.titleLabel.text = post.content
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "microPostDetail" {
            let microPostDetailViewControllerDestionation = segue.destination as! MicroPostDetailViewController
            if let rowIndex = self.microTableView.indexPathForSelectedRow?.row {
                let post = self.posts[rowIndex]
                microPostDetailViewControllerDestionation.content = post.content
            }
        }
    }
    
}
