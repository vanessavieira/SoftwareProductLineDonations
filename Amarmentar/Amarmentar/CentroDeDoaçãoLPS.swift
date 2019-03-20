//
//  CentroDeDoaçãoLPS.swift
//  FirebaseTutorial
//
//  Created by Vanessa Soares Vieira on 14/03/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import Foundation

class CentroDeDoaçãoLPS {
    
    var key: String! = nil
    var nomeCentroDoação: String! = nil
    var nomeCentroDoação2: String! = nil
    var cidade: String! = nil
    var endereço: String! = nil
    var cep: String! = nil
    var telefone: String! = nil
    var email: String! = nil
    var horario: String! = nil
    var necessidade: String! = nil
    
    init(key: String = "",nomeCentroDoação: String, nomeCentroDoação2: String, cidade: String, endereço: String, cep: String, telefone: String, email: String, horario: String, necessidade: String) {
        self.key = key
        self.nomeCentroDoação = nomeCentroDoação
        self.nomeCentroDoação2 = nomeCentroDoação2
        self.cidade = cidade
        self.endereço = endereço
        self.cep = cep
        self.telefone = telefone
        self.email = email
        self.horario = horario
        self.necessidade = necessidade    }
    
    func toAnyObject() -> Any! {
        return nil
    }
    
}
