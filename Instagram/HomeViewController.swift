//
//  HomeViewController.swift
//  Instagram
//
//  Created by Edison Lam on 3/11/17.
//  Copyright © 2017 Edison Lam. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var posts: [PFObject] = []
    
    public func queryPosts() {
        // construct PFQuery
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = 20
        
        print("Fetching data...")
        // fetch data asynchronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let posts = posts {
                // do something with the data fetched
                self.posts = posts
                print("Retrived the Posts!")
                print("findObjectsInBackground: \n\(posts)")
                
                print("findObjectsInBackground : reloadData ...")
                self.tableView.reloadData()
                print("findObjectsInBackground : Data Reloaded")
            } else {
                // handle error
                print("findObjectsInBackground Error : \(error?.localizedDescription)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("View Did Load")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        print("Making a query")
        queryPosts()
        print("Made a query")
        
        //print("Reloading tableView")
        //self.tableView.reloadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection: \(posts.count)")
        return posts.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        //cell.post = posts[indexPath.row]
        //let post = Post.init(obj: posts[indexPath.row])
        //print("cellForRowAt: \(posts[indexPath.row])")
        let post = posts[indexPath.row]
        //cell.postImageView = post["media"]
        cell.captionLabel.text = post["caption"] as! String?
        
        //TODO : fetch image from PFObject
        cell.postImageView.file = post["media"] as! PFFile
        cell.postImageView.loadInBackground()
        
        return cell
    }
    
    @IBAction func onProfileBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueFromHomeToProfile", sender: nil)
    }
    
    @IBAction func onCaptureBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueFromHomeToCapture", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
