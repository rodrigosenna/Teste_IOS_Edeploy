//
//  ViewController.swift
//  TesteEdeployIOS
//
//  Created by Rodrigo Sena de Oliveira on 23/07/17.
//  Copyright © 2017 RSO Tecnologia LTDA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtCidade: UITextField!
    
    @IBOutlet weak var txtEstado: UITextField!
    
    
    @IBAction func btnBuscar(_ sender: Any) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultadoFiltro" {
            
                let viewTableViewControllerDestino = segue.destination as! TableViewContorller
                viewTableViewControllerDestino.cidadeFiltro = self.txtCidade.text!
                viewTableViewControllerDestino.estadoFiltro = self.txtEstado.text!

        }

        
    }


}

