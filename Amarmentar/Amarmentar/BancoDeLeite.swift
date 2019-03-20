//
//  BancoDeLeite.swift
//  FirebaseTutorial
//
//  Created by Vanessa Soares Vieira on 03/01/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import Foundation
import FirebaseDatabase

class BancoDeLeite: CentroDeDoaçãoLPS {
    
    var keySnapshot: String!
    var nomeCentroDoaçãoSnapshot: String!
    var nomeCentroDoação2Snapshot: String!
    var cidadeSnapshot: String!
    var endereçoSnapshot: String!
    var cepSnapshot: String!
    var telefoneSnapshot: String!
    var emailSnapshot: String!
    var horarioSnapshot: String!
    var necessidadeSnapshot: String!
    
    let quantidadeBebe: String
    let ref: FIRDatabaseReference?
    
    init(key: String = "",nomeCentroDoação: String, nomeCentroDoação2: String, cidade: String, endereço: String, cep: String, telefone: String, email: String, horario: String, quantidadeBebe: String, necessidade: String) {
        
        self.quantidadeBebe = quantidadeBebe
        self.ref = nil
        super.init(key: key, nomeCentroDoação: nomeCentroDoação, nomeCentroDoação2: nomeCentroDoação2, cidade: cidade, endereço: endereço, cep: cep, telefone: telefone, email: email, horario: horario, necessidade: necessidade)
    }
    
    init(snapshot: FIRDataSnapshot) {
        keySnapshot = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        nomeCentroDoaçãoSnapshot = snapshotValue["nomeCentroDoação"] as? String
        nomeCentroDoação2Snapshot = snapshotValue["nomeCentroDoação2"] as? String
        cidadeSnapshot = snapshotValue["cidade"] as? String
        endereçoSnapshot = snapshotValue["endereço"] as? String
        cepSnapshot = snapshotValue["cep"] as? String
        telefoneSnapshot = snapshotValue["telefone"] as? String
        emailSnapshot = snapshotValue["email"] as? String
        horarioSnapshot = snapshotValue["horario"] as? String
        quantidadeBebe = snapshotValue["quantidadeBebe"] as! String
        necessidadeSnapshot = snapshotValue["necessidade"] as? String
        ref = snapshot.ref
        
        super.init(key: keySnapshot, nomeCentroDoação: nomeCentroDoaçãoSnapshot, nomeCentroDoação2: nomeCentroDoação2Snapshot, cidade: cidadeSnapshot, endereço: endereçoSnapshot, cep: cepSnapshot, telefone: telefoneSnapshot, email: emailSnapshot, horario: horarioSnapshot, necessidade: necessidadeSnapshot)
    }
    
    override func toAnyObject() -> Any {
        return [
            "nomeCentroDoação": nomeCentroDoação,
            "nomeCentroDoação2": nomeCentroDoação2,
            "cidade": cidade,
            "endereço":  endereço,
            "cep": cep,
            "telefone": telefone,
            "email": email,
            "horario":  horario,
            "quantidadeBebe": quantidadeBebe,
            "necessidade": necessidade
        
        ]
    }
    
}
