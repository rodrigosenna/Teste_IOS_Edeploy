//
//  DetalhesViewController.swift
//  TesteEdeployIOS
//
//  Created by Rodrigo Sena de Oliveira on 23/07/17.
//  Copyright © 2017 RSO Tecnologia LTDA. All rights reserved.
//

import Foundation
import UIKit

class DetalhesViewController:UIViewController{
    
   
    @IBOutlet weak var lblResultado: UILabel!
    
    var varPontuacao: String!
    var endereco: Endereco!
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //################################ Busca Pontos ####################################
        let headers = [
            "content-type": "application/json",
            "cache-control": "no-cache",
            "postman-token": "6161ec92-19aa-2468-96c5-63a6b1695aab"
        ]
        let parameters = [
            //"Nome": "Barueri",
            //"Estado": "São Paulo"
            "Nome":  endereco.cidade,
            "Estado": endereco.estado
            ] as [String : Any]
        
        //let postData = JSONSerialization.data(withJSONObject: parameters, options: [])
        do {
            let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            
            let request  = NSMutableURLRequest(url: NSURL(string: "http://wsteste.devedp.com.br/Master/CidadeServico.svc/rest/BuscaPontos")! as URL,
                                               cachePolicy: .useProtocolCachePolicy,
                                               timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = postData as Data
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print("deu erro")
                } else {
                    print("funcionou")
                    
                    let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    print("A pontuação da cidade é  \(dataString!)")
                    
                    let varReultadoPost = " \(dataString!)"
                    self.varPontuacao = varReultadoPost
                    let mensagem = "A pontuação da cidade " + self.endereco.cidade + " é " + self.varPontuacao
                    
                    self.lblResultado.text = mensagem
                    
                    let alertaController = UIAlertController(title: "Resultado", message: mensagem, preferredStyle: .alert);                     let acaoConfirmar    = UIAlertAction(title: "OK", style: .default, handler: nil)
                    
                    alertaController.addAction(acaoConfirmar)
                    
                    self.present(alertaController, animated: true, completion: nil)
                }
            })
            
            dataTask.resume()
            
        } catch let error as NSError {
            print(error)
        }
        //################################ Busca Pontos ####################################
        
      
        
    }
    
    override func didReceiveMemoryWarning() {
        self.didReceiveMemoryWarning()


    }
    // Dispose of any resources that can be recreated.

    
}
