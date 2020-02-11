//
//  FichaController.swift
//  brasileirao
//
//  Created by Ana Julia on 2/10/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import UIKit

class LanceALanceController: UITableViewController{

@IBOutlet var rodadasBar: UINavigationItem!
    
    var lances : [LanceALanceModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Requisitions.loadLanceLance(idJogo: 1, token: LoginController.token, onComplete: { (lance) in
            
            self.lances = lance
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
               
           }) { (error) in
               print(error)
        }
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lances.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellLance", for: indexPath) as! LanceaLanceTableViewCell
        
        let lance = lances[indexPath.row]
        
        cell.prepare(with: lance)
        
        return cell
    }
    
}
