//
//  MealsTableViewController.swift
//  firts-app
//
//  Created by Matheus on 23/08/19.
//  Copyright © 2019 iCasei. All rights reserved.
//

import Foundation
import UIKit

class MealsTableViewController:UITableViewController, AddAMealDelegate {
    
    
    var meals =  [Meal(name: "Lasanha", happiness: 5)]
    func add(_ meal:Meal){
 
        meals.append(meal);
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "addMeal"){
            let view =  segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let meal = meals[row]
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        
        
        cell.textLabel!.text = meal.name
        
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell
        
        
    }
    
    
    @objc func showDetails(longPressRecognizer: UILongPressGestureRecognizer){
        if longPressRecognizer.state == UIGestureRecognizer.State.began{
            let cell = longPressRecognizer.view as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            if let row = indexPath?.row {
                let meal = meals[row]
                
                RemoveMealController(controller:self).show(meal, handler:  { action in
                    self.meals.remove(at: row)
                    self.tableView.reloadData()
                    
                })
               
            }
        }
    }
    

    
    
    
}
