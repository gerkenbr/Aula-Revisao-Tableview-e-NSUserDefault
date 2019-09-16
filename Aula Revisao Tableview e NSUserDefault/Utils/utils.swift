//
//  utils.swift
//  Aula Revisao Tableview e NSUserDefault
//
//  Created by Digital House on 11/09/19.
//  Copyright © 2019 Alexandre Gerken Brasil. All rights reserved.
//

import Foundation


class SessionManager {
    
    // Isto é um singleton
    // acesssse a var ListaProduto de qualquer lugar com
    // Sessionmanager.shared.listaProdutos
    
    static let shared: SessionManager = SessionManager()
    
    var listaProdutos: [Produto] = []
    var arrayDicProduto: [[String:Any]] = []
    
    func fazArrayDicProduto(dicionario: [[String:Any]]) {
        
        //self.arrayDicProduto.append(dicionario)
        
        Utils.saveObject(key: "arrayDicProduto", value: SessionManager.shared.arrayDicProduto)
    }
    
    func encerraSessao() {
        var dicAtual: [String:Any] = [String:Any]()
        
        for produto in SessionManager.shared.listaProdutos {
            dicAtual = produto.convertForDic()
        //self.fazArrayDicProduto(dicionario: dicAtual)
        self.arrayDicProduto.append(dicAtual)
        }
        self.fazArrayDicProduto(dicionario: arrayDicProduto)
    }
    
    func abreSessao() {
        
       
        if let arrayDicOld = Utils.getObject(key: "arrayDicProduto") {

            if let _tempArrayDicOld: [[String:Any]] = arrayDicOld as? [[String:Any]] {
                
                for value in _tempArrayDicOld {
                    
                    let _product: Produto = Produto(nomeProduto: value["nome"] as! String, qtdeProduto: value["qtdeProduto"] as! Int)
                    
                    SessionManager.shared.listaProdutos.append(_product)
                }
           
//            for dic in arrayDicOld as! [[String:Any]]{
//
//                    self.listaProdutos.append(Produto(nomeProduto: dic["nome"] as! String, qtdeProduto: dic["qtdeProduto"] as! Int))
            
            }
            
        }
        
        
    }
    
}

class Utils {
    
    // metodo "stati" nao precisa de instancia para acessar.\
    // apenas a classe por exemplo Utils.saveStringObject(...)
    
    static func saveStringObject(key: String, value: String) {
    
        UserDefaults.standard.set(value, forKey: key)
    
    }
    
    static func getStringObject(key: String) -> String? {
        
        let value = UserDefaults.standard.string(forKey: key)
        return value
        
    }
    
    
    static func saveObject(key: String, value: Any) {

        UserDefaults.standard.set(value, forKey: key)
        
    }

    static func getObject(key: String) -> Any? {
        
        let value = UserDefaults.standard.object(forKey: key)
        
        return value
    
    }

    
}
    


