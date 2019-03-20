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
    
    var ref: FIRDatabaseReference?
    
    var hemocentros: [Hemocentro] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference(withPath: "Hemocentro")
        
        tableView.allowsMultipleSelectionDuringEditing = false
        
        ref?.observe(.value, with: { snapshot in

            var novosHemocentros: [Hemocentro] = []
        
            for item in snapshot.children {
                
                let novoHemocentro = Hemocentro(snapshot: item as! FIRDataSnapshot)
                
                novosHemocentros.append(novoHemocentro)
            }
            
            self.hemocentros = novosHemocentros
            self.tableView.reloadData()
        })
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hemocentros.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoarCell", for: indexPath)
     
        let hemoCentro = hemocentros[indexPath.row]
        
        cell.textLabel?.text = hemoCentro.nomeCentroDoação
        cell.detailTextLabel?.text = hemoCentro.nomeCentroDoação2
        
        return cell
     }
 
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
     }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexSelecionado = tableView.indexPathForSelectedRow?.row
        
        let hemocentro = self.hemocentros[indexSelecionado!]
        
        print(hemocentro)
        
        if segue.identifier == "cellDetailSegue" {
            if let hemocentroDetalhes = segue.destination as? DetalhesViewController {
                hemocentroDetalhes.hemocentroEscolhido = hemocentro
            }
        }
        
     }
 

    
    

}
