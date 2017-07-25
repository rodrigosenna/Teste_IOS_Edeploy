//
//  TableViewContorller.swift
//  TesteEdeployIOS
//
//  Created by Rodrigo Sena de Oliveira on 24/07/17.
//  Copyright © 2017 RSO Tecnologia LTDA. All rights reserved.
//

import UIKit

class TableViewContorller: UITableViewController {
    
    var enderecos: [Endereco] = [] // array utlizando o tipo objeto criado endereco
    var cidadeFiltro: String!
    var estadoFiltro: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var endereco: Endereco // cria variavel do tipo da classe
        
        //##INICIO####################### RECUPERA DADOS FITRADOS POR CIDADE E ESTADO ############################INICIO##
        let url = NSURL(string: "http:wsteste.devedp.com.br/Master/CidadeServico.svc/rest/BuscaTodasCidades")
        let data = NSData(contentsOf: url! as URL)
        
        let values = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        
        var arrayNome        = [""]
        var arrayEstado      = [""]
        
        arrayNome   = (values.value(forKey: "Nome") as? [String])!
        arrayEstado = (values.value(forKey: "Estado") as? [String])!
        
        var cont:Int = 0;
        
        //while cont <= xarrayNome.count {
        while cont <= 9713 {
            
            let cidadeUpper = arrayNome[cont].uppercased()
            let estadoUpper = arrayEstado[cont].uppercased()
            let cidadeFiltroUpper = self.cidadeFiltro.uppercased()
            let estadoFiltroUpper = self.estadoFiltro.uppercased()
          
            // ALTERNATIVA: retirar case sensitive
            if cidadeUpper.uppercased().range(of:cidadeFiltroUpper) != nil {
                if estadoUpper.uppercased().range(of:estadoFiltroUpper) != nil {
                    endereco = Endereco(cidade: arrayNome[cont] , estado: arrayEstado[cont] )
                    enderecos.append( endereco )// atribui array com o valor do objeto
                }
            }
            cont = cont + 1;
        }
        //##FIM####################### RECUPERA DADOS FITRADOS POR CIDADE E ESTADO ############################FIM##
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return enderecos.count /// para contar a quantidade de itens que temos dentro do objeto filmes
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let endereco: Endereco = enderecos[indexPath.row]// estamos recuperando a primeira linha q sera montada
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! EnderecoCelula
        
        celula.cidadeLabel.text   = endereco.cidade
        celula.estadoLabel.text   = endereco.estado
        
        return celula
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detalheEndereco" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let enderecoSelecionado = self.enderecos [indexPath.row]
                let viewControllerDestino = segue.destination as! DetalhesViewController
                viewControllerDestino.endereco = enderecoSelecionado
           }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

