//
//  DetalhesMaeViewController.swift
//  FirebaseTutorial
//
//  Created by Vanessa Soares Vieira on 04/01/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class DetalhesMaeViewController: UIViewController {
    
    var maeEscolhida: MaeDoadora?
    
    
    @IBOutlet weak var nomeHospitalLabel: UILabel!

    @IBOutlet weak var nomeMaeLabel: UILabel!
    
    @IBOutlet weak var cidadeLabel: UILabel!
    
    @IBOutlet weak var telefoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(maeEscolhida!.nomeCentroDoação)
        
        nomeHospitalLabel.text = maeEscolhida!.nomeCentroDoação
        nomeMaeLabel.text = maeEscolhida!.nome
        cidadeLabel.text = maeEscolhida!.cidade
        telefoneLabel.text = maeEscolhida!.telefone
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
