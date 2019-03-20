//
//  DetalhesMaeTableViewController.swift
//  FirebaseTutorial
//
//  Created by Vanessa Soares Vieira on 04/01/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class DetalhesDoadorTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) {
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return cell
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
 
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "donateDetailSegue" {
            
        }
    }
}
