//
//  MyCustomTableViewCell.swift
//  Aula Revisao Tableview e NSUserDefault
//
//  Created by Digital House on 11/09/19.
//  Copyright © 2019 Alexandre Gerken Brasil. All rights reserved.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var produtoLabel: UILabel!
    
    @IBOutlet weak var qtdeLabel: UILabel!
    
    @IBOutlet weak var qtdeStepper: UIStepper!
    
    @IBAction func clicouStepper(_ sender: UIStepper) {
        
        self.qtdeLabel.text = String(format: "%.0f", sender.value)
        self.atualizarProdutos(stepper: sender)
        
    }
    
    func setup(produto: Produto) {
        
        self.produtoLabel.text = produto.nomeProduto
        self.qtdeLabel.text = String(produto.qtdeProduto)

    }
    
    func atualizarProdutos(stepper: UIStepper) {
        
        // alternativamente, criar produtoAtual = Produto (ele proprio) no Setup
        // com isso, poderiamos usar apenas
        // self.produtoAtual?.quantidade = stepper.value para atualizar o valor
        
        for produto in 0..<SessionManager.shared.listaProdutos.count {
            
            if SessionManager.shared.listaProdutos[produto].nomeProduto == self.produtoLabel.text {
            
                if SessionManager.shared.listaProdutos[produto].qtdeProduto != Int(stepper.value) {
                    
                SessionManager.shared.listaProdutos[produto].qtdeProduto = Int(stepper.value)
                
                }
            }
        }
    }

}
