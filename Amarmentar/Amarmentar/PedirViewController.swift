//
//  PedirViewController.swift
//  FirebaseTutorial
//
//  Created by Vanessa Soares Vieira on 02/01/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class PedirViewController: UIViewController {
    
    var ref: FIRDatabaseReference?
    
    var bancos: [BancoDeLeite] = []
    
    
    @IBOutlet weak var nomeHospital: UITextField!
    
    @IBOutlet weak var nomeBanco: UITextField!
    
    @IBOutlet weak var cidade: UITextField!
    
    @IBOutlet weak var endereço: UITextField!
    
    @IBOutlet weak var cep: UITextField!
    
    @IBOutlet weak var telefone: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var horario: UITextField!
    
    @IBOutlet weak var quantidadeBebe: UITextField!
    
    @IBOutlet weak var necessidade: UITextField!
    
    
    @IBAction func confirmarPedido(_ sender: Any) {
        
//        let userID: String = FIRAuth.auth()!.currentUser!.uid
//        
//        print(userID)

        
        if (nomeHospital.text != "" && nomeBanco.text != "" && cidade.text != "" && endereço.text != "" && cep.text != "" && telefone.text != "" && email.text != "" && horario.text != "" && quantidadeBebe.text != "" && necessidade.text != "") {
            
            let bancoLeite = BancoDeLeite(nomeCentroDoação: nomeHospital.text!, nomeCentroDoação2:  nomeBanco.text!, cidade: cidade.text!, endereço: endereço.text!, cep: cep.text!, telefone: telefone.text!, email: email.text!, horario: horario.text!, quantidadeBebe: quantidadeBebe.text!, necessidade: necessidade.text!)
            
            let bancoLeiteRef = self.ref?.child(nomeBanco.text!.lowercased())
            
            bancoLeiteRef?.setValue(bancoLeite.toAnyObject())
                      
            nomeHospital.text = ""
            nomeBanco.text = ""
            cidade.text = ""
            endereço.text = ""
            cep.text = ""
            telefone.text = ""
            email.text = ""
            horario.text = ""
            quantidadeBebe.text = ""
            necessidade.text = ""
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference(withPath: "BancoDeLeite")

    }


}
