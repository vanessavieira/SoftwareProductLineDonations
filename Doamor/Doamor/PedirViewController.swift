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
    
    var hemocentros: [Hemocentro] = []
    
    
    @IBOutlet weak var nomeCentroDoação: UITextField!
    
    @IBOutlet weak var nomeCentroDoação2: UITextField!
    
    @IBOutlet weak var cidade: UITextField!
    
    @IBOutlet weak var endereço: UITextField!
    
    @IBOutlet weak var cep: UITextField!
    
    @IBOutlet weak var telefone: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var horario: UITextField!
    
   // @IBOutlet weak var quantidadeBebe: UITextField!
    
    @IBOutlet weak var necessidade: UITextField!
    
    
    @IBAction func confirmarPedido(_ sender: Any) {
        
//        let userID: String = FIRAuth.auth()!.currentUser!.uid
//        
//        print(userID)

        
        if (nomeCentroDoação.text != "" && nomeCentroDoação2.text != "" && cidade.text != "" && endereço.text != "" && cep.text != "" && telefone.text != "" && email.text != "" && horario.text != "" && necessidade.text != "") {
            
            let hemocentro = Hemocentro(nomeCentroDoação: nomeCentroDoação.text!, nomeCentroDoação2:  nomeCentroDoação2.text!, cidade: cidade.text!, endereço: endereço.text!, cep: cep.text!, telefone: telefone.text!, email: email.text!, horario: horario.text!, necessidade: necessidade.text!)
            
            let hemocentroRef = self.ref?.child(nomeCentroDoação.text!.lowercased())
            
            hemocentroRef?.setValue(hemocentro.toAnyObject())
                      
            nomeCentroDoação.text = ""
            nomeCentroDoação2.text = ""
            cidade.text = ""
            endereço.text = ""
            cep.text = ""
            telefone.text = ""
            email.text = ""
            horario.text = ""
            necessidade.text = ""
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference(withPath: "Hemocentro")

    }


}
