//
//  DetalhesMaeViewController.swift
//  FirebaseTutorial
//
//  Created by Vanessa Soares Vieira on 04/01/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class DetalhesDoadorViewController: UIViewController {
    
    var doadorEscolhido: Doador?
    
    
    @IBOutlet weak var nomeHospitalLabel: UILabel!

    @IBOutlet weak var nomeLabel: UILabel!
    
    @IBOutlet weak var enderecoLabel: UILabel!
    
    @IBOutlet weak var telefoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(doadorEscolhido!.nomeCentroDoação)
        
        nomeHospitalLabel.text = doadorEscolhido!.nomeCentroDoação
        nomeLabel.text = doadorEscolhido!.nome
        enderecoLabel.text = doadorEscolhido!.endereço
        telefoneLabel.text = doadorEscolhido!.telefone
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
