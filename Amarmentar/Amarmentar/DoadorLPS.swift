//
//  DoadorLPS.swift
//  FirebaseTutorial
//
//  Created by Vanessa Soares Vieira on 13/03/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import Foundation

class DoadorLPS {
    var key: String! = nil
    var nome: String! = nil
    var cpf : Int! = nil
    var cartaoSUS : Int! = nil
    var cidade : String! = nil
    var endereço : String! = nil
    var nomeCentroDoação : String! = nil
    var telefone: String! = nil
    
    init(key: String, nome: String, cpf: Int, cartaoSUS: Int, cidade: String, endereço: String, nomeCentroDoação: String, telefone: String) {
        self.key = key
        self.nome = nome
        self.cpf = cpf
        self.cartaoSUS = cartaoSUS
        self.cidade = cidade
        self.endereço = endereço
        self.nomeCentroDoação = nomeCentroDoação
        self.telefone = telefone
    }
    
    func toAnyObject() -> Any! {
        return nil
    }
    
}
