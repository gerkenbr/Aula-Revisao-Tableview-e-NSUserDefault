//
//  File.swift
//  Aula Revisao Tableview e NSUserDefault
//
//  Created by Digital House on 11/09/19.
//  Copyright © 2019 Alexandre Gerken Brasil. All rights reserved.
//

import Foundation


class Produto {
    
    var nomeProduto: String
    var qtdeProduto: Int = 0
    
    init(nomeProduto: String, qtdeProduto: Int = 0) {
        self.nomeProduto = nomeProduto
    }
    
    func transformaProdutoEmDicionario(nomeProduto: String, qtdeProduto: Int) -> [String:Int] {
    
        let novoDic: [String:Int] = [nomeProduto:qtdeProduto]
    
        return novoDic
    }
    
    func convertForDic() -> [String:Any] {
        
        let dic:[String: Any] = ["nome":self.nomeProduto, "qtdeProduto": self.qtdeProduto ]
        
        return dic
    }
 
}
