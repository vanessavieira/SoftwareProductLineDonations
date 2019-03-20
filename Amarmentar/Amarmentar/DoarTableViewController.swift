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
    
    var bancos: [BancoDeLeite] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference(withPath: "BancoDeLeite")
        
        tableView.allowsMultipleSelectionDuringEditing = false
        
        ref?.observe(.value, with: { snapshot in

            var novosBancos: [BancoDeLeite] = []
        
            for item in snapshot.children {
                
                let novoBanco = BancoDeLeite(snapshot: item as! FIRDataSnapshot)
                
                novosBancos.append(novoBanco)
            }
            
            self.bancos = novosBancos
            self.tableView.reloadData()
        })
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bancos.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoarCell", for: indexPath)
     
        let bancoLeite = bancos[indexPath.row]
        
        cell.textLabel?.text = bancoLeite.nomeCentroDoação
        cell.detailTextLabel?.text = bancoLeite.nomeCentroDoação2
        
        return cell
     }
 
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
     }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexSelecionado = tableView.indexPathForSelectedRow?.row
        
        let banco = self.bancos[indexSelecionado!]
        
        print(banco)
        
        if segue.identifier == "cellDetailSegue" {
            if let bancoDetalhes = segue.destination as? DetalhesViewController {
                bancoDetalhes.bancoEscolhido = banco
            }
        }
        
     }
 

    
    

}
