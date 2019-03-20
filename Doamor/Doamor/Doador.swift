//
//  Doador.swift
//  FirebaseTutorial
//
//  Created by Vanessa Soares Vieira on 07/03/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Doador: DoadorLPS {
    
    var keySnapshot: String!
    var nomeSnapshot: String!
    var cpfSnapshot : Int!
    var cartaoSUSSnapshot : Int!
    var endereçoSnapshot : String!
    var cidadeSnapshot : String!
    let tipo_sang : String
    let idade : Bool
    let peso : Bool
    let tatuagem : Bool
    let amamentacao : Bool
    let doenca : String
    var nomeCentroDoaçãoSnapshot : String!
    var telefoneSnapshot: String!
    let ref: FIRDatabaseReference?
    
    init(key: String = "", nome : String, cpf: Int, cartaoSUS: Int, cidade: String, endereço: String, tipo_sang: String, idade: Bool, peso: Bool, tatuagem: Bool, amamentacao: Bool, doenca: String, nomeCentroDoação: String, telefone: String)
    {
        
        self.tipo_sang = tipo_sang
        self.idade = idade
        self.peso = peso
        self.tatuagem = tatuagem
        self.amamentacao = amamentacao
        self.doenca = doenca
        self.ref = nil
        super.init(key: key, nome: nome, cpf: cpf, cartaoSUS: cartaoSUS, cidade: cidade, endereço: endereço, nomeCentroDoação: nomeCentroDoação, telefone: telefone)
    }
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        keySnapshot = snapshot.key
        nomeSnapshot = snapshotValue["nome"] as? String
        cpfSnapshot = snapshotValue["cpf"] as? Int
        endereçoSnapshot = snapshotValue["endereço"] as? String
        cidadeSnapshot = snapshotValue["cidade"] as? String
        tipo_sang = snapshotValue["tipo_sang"] as! String
        cartaoSUSSnapshot = snapshotValue["cartaoSUS"] as? Int
        idade = snapshotValue["idade"] as! Bool
        peso = snapshotValue["peso"] as! Bool
        tatuagem = snapshotValue["tatuagem"] as! Bool
        amamentacao = snapshotValue["amamentacao"] as! Bool
        doenca = snapshotValue["doenca"] as! String
        nomeCentroDoaçãoSnapshot = snapshotValue["nomeCentroDoação"] as? String
        telefoneSnapshot = snapshotValue["telefone"] as? String
        ref = snapshot.ref
        super.init(key: keySnapshot, nome: nomeSnapshot, cpf: cpfSnapshot, cartaoSUS: cartaoSUSSnapshot, cidade: cidadeSnapshot, endereço: endereçoSnapshot, nomeCentroDoação: nomeCentroDoaçãoSnapshot, telefone: telefoneSnapshot)
    }
    
    override func toAnyObject() -> Any {
        return [
            "nome": nome,
            "cpf": cpf,
            "endereço":  endereço,
            "cartaoSUS": cartaoSUS,
            "tipo_sang": tipo_sang,
            "idade": idade,
            "peso":  peso,
            "tatuagem": tatuagem,
            "amamentacao": amamentacao,
            "doenca": doenca,
            "nomeCentroDoação": nomeCentroDoação,
            "telefone": telefone
            
        ]
    }
    
}
