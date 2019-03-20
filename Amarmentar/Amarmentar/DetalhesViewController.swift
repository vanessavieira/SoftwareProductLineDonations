//
//  DetalhesViewController.swift
//  FirebaseTutorial
//
//  Created by Vanessa Soares Vieira on 04/01/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit


class DetalhesViewController: UIViewController {
    
    var bancoEscolhido: BancoDeLeite?
    
    
    @IBOutlet weak var nomeHospitalLabel: UILabel!
    
    @IBOutlet weak var nomeBancoLabel: UILabel!
    
    @IBOutlet weak var quantidadeBebeLabel: UILabel!
    
    @IBOutlet weak var necessidadeLabel: UILabel!
    
    @IBOutlet weak var endereçoLabel: UILabel!
    
    @IBOutlet weak var cidadeLabel: UILabel!
    
    @IBOutlet weak var telefoneLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var horarioLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // print(bancoEscolhido?.nomeHospital)
        
        nomeHospitalLabel.text = bancoEscolhido?.nomeCentroDoação
        nomeBancoLabel.text = bancoEscolhido?.nomeCentroDoação2
        quantidadeBebeLabel.text = bancoEscolhido?.quantidadeBebe
        necessidadeLabel.text = bancoEscolhido?.necessidade
        endereçoLabel.text = bancoEscolhido?.endereço
        cidadeLabel.text = bancoEscolhido?.cidade
        telefoneLabel.text = bancoEscolhido?.telefone
        emailLabel.text = bancoEscolhido?.email
        horarioLabel.text = bancoEscolhido?.horario
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let hospitalEscolhidoNome = self.bancoEscolhido?.nomeCentroDoação
        
        if segue.identifier == "doarSegue" {
            if let nomeHospitalEscolhido = segue.destination as? DoarViewController {
                nomeHospitalEscolhido.hospitalEscolhido = hospitalEscolhidoNome!
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
