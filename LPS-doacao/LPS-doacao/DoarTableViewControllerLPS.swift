//
//  DoarTableViewController.swift
//  FirebaseTutorial
//
//  Created by Vanessa Soares Vieira on 03/01/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class DoarTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -
        return cell
     }
 
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
     }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexSelecionado = tableView.indexPathForSelectedRow?.row
        
        if segue.identifier == "cellDetailSegue" {
            if let bancoDetalhes = segue.destination as? DetalhesViewController {
                
            }
        }
        
     }
 

    
    

}
