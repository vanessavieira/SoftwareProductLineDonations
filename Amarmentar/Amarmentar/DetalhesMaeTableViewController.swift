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

class DetalhesMaeTableViewController: UITableViewController {
    
    var ref: FIRDatabaseReference?
    
    var maes: [MaeDoadora] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference(withPath: "MaeDoadora")
        
        tableView.allowsMultipleSelectionDuringEditing = false
        
        ref?.observe(.value, with: { snapshot in
            
            var novasMaes: [MaeDoadora] = []
            
            for item in snapshot.children {
                
                let novaMae = MaeDoadora(snapshot: item as! FIRDataSnapshot)
                
                novasMaes.append(novaMae)
            }
            
            self.maes = novasMaes
            self.tableView.reloadData()
        })
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return maes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "maeCell", for: indexPath)

        let maeDoar = maes[indexPath.row]
        
        cell.textLabel?.text = maeDoar.nome
        cell.detailTextLabel?.text = maeDoar.nomeCentroDoação

        return cell
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
 
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexSelecionado = tableView.indexPathForSelectedRow?.row
        
        let mae = maes[indexSelecionado!]
        
        print(mae)
        
        if segue.identifier == "donateDetailSegue" {
            if let maeDetalhes = segue.destination as? DetalhesMaeViewController {
                maeDetalhes.maeEscolhida = mae
            }
        }
        
    }
    

}
