//
//  ViewController.swift
//  Aula Revisao Tableview e NSUserDefault
//
//  Created by Digital House on 11/09/19.
//  Copyright © 2019 Alexandre Gerken Brasil. All rights reserved.
//

import UIKit

// lista de compras
// tableView com 1 customCell, com o nome do item, e um stepper para ajustar a quantidade
// textfield no topo da tableView, para inclusao dos produtos
// produto tem nome, preco, e quantidade

class HomeViewController: UIViewController {

    //var listaProduto: [Produto] = []
    //mudou para o singleton
    
    @IBOutlet weak var myTableview: UITableView!
    
    @IBOutlet weak var novoProdutoTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableview.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCustomCell")
        
        self.myTableview.delegate = self
        self.myTableview.dataSource = self
        self.novoProdutoTextfield.delegate = self
        
        
        
        // Do any additional setup after loading the view.
    }

    func digitouProduto(nomeProduto: String) {
        
        if nomeProduto != "" {
            
            SessionManager.shared.listaProdutos.append(Produto(nomeProduto: nomeProduto))
            
            myTableview.reloadData()
        }
        
    }
    
    
    

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SessionManager.shared.listaProdutos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell: MyCustomTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as? MyCustomTableViewCell
        
        cell?.setup(produto: SessionManager.shared.listaProdutos[indexPath.row])
        
        
        return cell ?? UITableViewCell()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        digitouProduto(nomeProduto: textField.text ?? "")
    
    return true
    }
    
    
}
