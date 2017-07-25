//
//  BuscaPontos.swift
//  TesteEdeployIOS
//
//  Created by Rodrigo Sena de Oliveira on 24/07/17.
//  Copyright © 2017 RSO Tecnologia LTDA. All rights reserved.
//

import UIKit

public  class BuscaPontos{
    
    var cidade:String!
    var estado:String!
    
    init(cidade:String, estado:String)
    {
        self.cidade = cidade
        self.estado = estado
    }
    
    //################################ Busca Pontos ####################################
    public func getPontos(cidade: String, estado: String) -> String {
        var varPontos:String!
        
        let headers = [
            "content-type": "application/json",
            "cache-control": "no-cache",
            "postman-token": "6161ec92-19aa-2468-96c5-63a6b1695aab"
        ]
        let parameters = [
            "Nome":  cidade,
            "Estado": estado
            ] as [String : Any]
        
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
                    print(data!)
                    print(postData)
                    
                    let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    print("A pontuação da cidade é  \(dataString!)")
                    
                     let varReultadoPost = " \(dataString!)"
                    //################################ Imprimi resultado ####################################
                     varPontos = varReultadoPost
                    
                    
                }
            })
            
            dataTask.resume()
            
            return  varPontos
            
        } catch let error as NSError {
            print(error)
            return ""
        }

        
    }//############################################# Fim Função get Pontos #############################################
 
    
}
