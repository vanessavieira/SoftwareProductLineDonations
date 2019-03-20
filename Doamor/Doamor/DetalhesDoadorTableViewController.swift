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
    
    var ref: FIRDatabaseReference?
    
    var doadores: [Doador] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference(withPath: "Doador")
        
        tableView.allowsMultipleSelectionDuringEditing = false
        
        ref?.observe(.value, with: { snapshot in
            
            var novosDoadores: [Doador] = []
            
            for item in snapshot.children {
                
                let novoDoador = Doador(snapshot: item as! FIRDataSnapshot)
                
                novosDoadores.append(novoDoador)
            }
            
            self.doadores = novosDoadores
            self.tableView.reloadData()
        })
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doadores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doadorCell", for: indexPath)

        let doadorSangue = doadores[indexPath.row]
        
        cell.textLabel?.text = doadorSangue.nome
        cell.detailTextLabel?.text = doadorSangue.nomeCentroDoação

        return cell
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
 
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexSelecionado = tableView.indexPathForSelectedRow?.row
        
        let doador = doadores[indexSelecionado!]
        
        print(doador)
        
        if segue.identifier == "donateDetailSegue" {
            if let doadorDetalhes = segue.destination as? DetalhesDoadorViewController {
                doadorDetalhes.doadorEscolhido = doador
            }
        }
        
    }
    

}
