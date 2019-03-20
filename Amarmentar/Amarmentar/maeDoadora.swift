//
//  maeDoadora.swift
//  FirebaseTutorial
//
//  Created by Vanessa Soares Vieira on 02/01/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import Foundation
import FirebaseDatabase

class MaeDoadora: DoadorLPS {
   
    let exame : Bool
    let bebida : Bool
    let fumo : Bool
    let droga : Bool
    let medicamento : String
    let ref: FIRDatabaseReference?
    var keySnapshot: String!
    var nomeSnapshot: String!
    var cpfSnapshot: Int!
    var cidadeSnapshot: String!
    var endereçoSnapshot: String!
    var cartaoSUSSnapshot: Int!
    var nomeCentroDoaçãoSnapshot: String!
    var telefoneSnapshot: String!
    
    init(key: String = "", nome : String, cpf: Int, cartaoSUS: Int, cidade: String, endereço: String, exame: Bool, bebida: Bool, fumo: Bool, droga: Bool, medicamento: String, nomeCentroDoação: String, telefone: String)
    {
        self.exame = exame
        self.bebida = bebida
        self.fumo = fumo
        self.droga = droga
        self.medicamento = medicamento
        self.ref = nil
        super.init(key: key, nome: nome, cpf: cpf, cartaoSUS: cartaoSUS, cidade: cidade, endereço: endereço, nomeCentroDoação: nomeCentroDoação, telefone: telefone)
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        keySnapshot = snapshot.key
        nomeSnapshot = snapshotValue["nome"] as? String
        cpfSnapshot = snapshotValue["cpf"] as? Int
        cidadeSnapshot = snapshotValue["cidade"] as? String
        endereçoSnapshot = snapshotValue["endereço"] as? String
        cartaoSUSSnapshot = snapshotValue["cartaoSUS"] as? Int
        nomeCentroDoaçãoSnapshot = snapshotValue["nomeCentroDoação"] as? String
        telefoneSnapshot = snapshotValue["telefone"] as? String
        exame = snapshotValue["exame"] as! Bool
        bebida = snapshotValue["bebida"] as! Bool
        fumo = snapshotValue["fumo"] as! Bool
        droga = snapshotValue["droga"] as! Bool
        medicamento = snapshotValue["medicamento"] as! String
        ref = snapshot.ref
        super.init(key: keySnapshot, nome: nomeSnapshot, cpf: cpfSnapshot, cartaoSUS: cartaoSUSSnapshot, cidade: cidadeSnapshot, endereço: endereçoSnapshot, nomeCentroDoação: nomeCentroDoaçãoSnapshot, telefone: telefoneSnapshot)
    }
    
    override func toAnyObject() -> Any! {
        return [
            "nome": nome,
            "cpf": cpf,
            "cidade": cidade,
            "endereço":  endereço,
            "cartaoSUS": cartaoSUS,
            "exame": exame,
            "bebida":  bebida,
            "fumo": fumo,
            "droga": droga,
            "medicamento": medicamento,
            "nomeCentroDoação": nomeCentroDoação,
            "telefone": telefone
            
        ]
    }
    
    
}
