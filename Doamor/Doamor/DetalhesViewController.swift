//
//  DetalhesViewController.swift
//  FirebaseTutorial
//
//  Created by Vanessa Soares Vieira on 04/01/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit


class DetalhesViewController: UIViewController {
    
    var hemocentroEscolhido: Hemocentro?
    
    
    @IBOutlet weak var nomeHospitalLabel: UILabel!
    
    @IBOutlet weak var nomeHemocentroLabel: UILabel!
    
    // @IBOutlet weak var quantidadeBebeLabel: UILabel!
    
    @IBOutlet weak var necessidadeLabel: UILabel!
    
    @IBOutlet weak var endereçoLabel: UILabel!
    
    @IBOutlet weak var cidadeLabel: UILabel!
    
    @IBOutlet weak var telefoneLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var horarioLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // print(bancoEscolhido?.nomeHospital)
        
        nomeHospitalLabel.text = hemocentroEscolhido?.nomeCentroDoação
        nomeHemocentroLabel.text = hemocentroEscolhido?.nomeCentroDoação2
        necessidadeLabel.text = hemocentroEscolhido?.necessidade
        endereçoLabel.text = hemocentroEscolhido?.endereço
        cidadeLabel.text = hemocentroEscolhido?.cidade
        telefoneLabel.text = hemocentroEscolhido?.telefone
        emailLabel.text = hemocentroEscolhido?.email
        horarioLabel.text = hemocentroEscolhido?.horario
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let hospitalEscolhidoNome = self.hemocentroEscolhido?.nomeCentroDoação
        
        if segue.identifier == "doarSegue" {
            if let nomeHospitalEscolhido = segue.destination as? DoarViewController {
                nomeHospitalEscolhido.nomeCentroDoação = hospitalEscolhidoNome!
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
