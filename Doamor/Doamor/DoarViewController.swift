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
    
    var doadoras: [Doador] = []
    
    var nomeCentroDoação: String?
    

    @IBOutlet weak var doenca: UITextField!
    
    
    @IBOutlet weak var doencaSwitch: UISwitch!
    
    
    @IBOutlet weak var amamentacaoSwitch: UISwitch!
    

    @IBOutlet weak var tatuagemSwitch: UISwitch!
    
    
    @IBOutlet weak var idadeSwitch: UISwitch!
    
    
    @IBOutlet weak var pesoSwitch: UISwitch!
    
    
    @IBOutlet weak var tipoSang: UITextField!
    
    
    @IBOutlet weak var telefone: UITextField!
    
    
    @IBOutlet weak var endereço: UITextField!
    
    
    // @IBOutlet weak var cidadeUf: UITextField!
    
    
    @IBOutlet weak var cartãoSUS: UITextField!
    
    
    @IBOutlet weak var CPF: UITextField!
    
    
    @IBOutlet weak var nome: UITextField!
    
    
    
    @IBAction func tomaMedicamento(_ sender: Any) {
        if doencaSwitch.isOn {
            self.doenca.isHidden = false
        } else {
            self.doenca.isHidden = true
        }
    
    }
    
    @IBAction func doar(_ sender: Any) {
        if (pesoSwitch.isOn) && (idadeSwitch.isOn) && !(tatuagemSwitch.isOn) && !(amamentacaoSwitch.isOn) && nome.text != "" && CPF.text != "" && cartãoSUS.text != "" && telefone.text != "" && tipoSang.text != "" {
            
            let doador = Doador(nome: nome.text!, cpf: Int(CPF.text!)!, cartaoSUS: Int(cartãoSUS.text!)!, cidade: endereço.text!, endereço: endereço.text!, tipo_sang: tipoSang.text!, idade: idadeSwitch.isOn, peso: pesoSwitch.isOn, tatuagem: tatuagemSwitch.isOn, amamentacao: amamentacaoSwitch.isOn, doenca: doenca.text!, nomeCentroDoação: nomeCentroDoação!, telefone: telefone.text!)
            
            let doadorRef = self.ref?.child(nome.text!.lowercased())
            
            doadorRef?.setValue(doador.toAnyObject())
            
            let alertController = UIAlertController(title: "Obrigada, sua doação foi registrada!", message: "O Hemocentro escolhido entrará em contato com você para prover informações de como prosseguir com a doação!", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
            nome.text = ""
            CPF.text = ""
            tipoSang.text = ""
            endereço.text = ""
            cartãoSUS.text = ""
            telefone.text = ""
            
            
        } else {
            let alertController = UIAlertController(title: "Erro", message: "Sentimos muito, mas você não pode doar sangue. Para saber mais, leia nossa seção de dúvidas.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
            nome.text = ""
            CPF.text = ""
            tipoSang.text = ""
            endereço.text = ""
            cartãoSUS.text = ""
            telefone.text = ""
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference(withPath: "Doador")
    }

    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//    }
 

}
