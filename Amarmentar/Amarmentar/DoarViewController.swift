//
//  DoarViewController.swift
//  FirebaseTutorial
//
//  Created by Vanessa Soares Vieira on 02/01/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DoarViewController: UIViewController {
    
    var ref: FIRDatabaseReference?
    
    var doadoras: [MaeDoadora] = []
    
    var hospitalEscolhido: String?
    

    @IBOutlet weak var medicamento: UITextField!
    
    
    @IBOutlet weak var medicamentoSwitch: UISwitch!
    
    
    @IBOutlet weak var drogaSwitch: UISwitch!
    

    @IBOutlet weak var fumoSwitch: UISwitch!
    
    
    @IBOutlet weak var bebidaSwitch: UISwitch!
    
    
    @IBOutlet weak var exameSwitch: UISwitch!
    
    
    @IBOutlet weak var telefone: UITextField!
    
    
    @IBOutlet weak var endereço: UITextField!
    
    
    @IBOutlet weak var cidadeUf: UITextField!
    
    
    @IBOutlet weak var cartãoSUS: UITextField!
    
    
    @IBOutlet weak var CPF: UITextField!
    
    
    @IBOutlet weak var nome: UITextField!
    
    
    
    @IBAction func tomaMedicamento(_ sender: Any) {
        if medicamentoSwitch.isOn {
            self.medicamento.isHidden = false
        } else {
            self.medicamento.isHidden = true
        }
    
    }
    
    @IBAction func doar(_ sender: Any) {
        if (exameSwitch.isOn) && !(bebidaSwitch.isOn) && !(fumoSwitch.isOn) && !(drogaSwitch.isOn) && nome.text != "" && CPF.text != "" && cartãoSUS.text != "" && telefone.text != "" && cidadeUf.text != "" {
            
            let maeDoadora = MaeDoadora(nome: nome.text!, cpf: Int(CPF.text!)!, cartaoSUS: Int(cartãoSUS.text!)!, cidade: cidadeUf.text!, endereço: endereço.text!, exame: exameSwitch.isOn, bebida: bebidaSwitch.isOn, fumo: fumoSwitch.isOn, droga: drogaSwitch.isOn, medicamento: medicamento.text!, nomeCentroDoação: hospitalEscolhido!, telefone: telefone.text!)
            
            let maeDoadoraRef = self.ref?.child(nome.text!.lowercased())
            
            maeDoadoraRef?.setValue(maeDoadora.toAnyObject())
            
            let alertController = UIAlertController(title: "Obrigada, sua doação foi registrada!", message: "Entre em contato com o Banco de Leite Humano escolhido para informações de como prosseguir com a doação!", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
            nome.text = ""
            CPF.text = ""
            cidadeUf.text = ""
            endereço.text = ""
            cartãoSUS.text = ""
            telefone.text = ""
            
            
        } else {
            let alertController = UIAlertController(title: "Erro", message: "Sentimos muito, mas você não pode doar leite materno. Para saber mais, leia nossa seção de dúvidas.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
            nome.text = ""
            CPF.text = ""
            cidadeUf.text = ""
            endereço.text = ""
            cartãoSUS.text = ""
            telefone.text = ""
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference(withPath: "MaeDoadora")
    }

    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//    }
 

}
