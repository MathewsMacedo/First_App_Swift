//
//  ViewController.swift
//  firts-app
//
//  Created by Matheus on 14/08/19.
//  Copyright © 2019 iCasei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, AddAnItemDelegate{
    
    
   
    
    //Declarando variaveis 
    @IBOutlet var foodField : UITextField?
    @IBOutlet var happinessField : UITextField?
    var delegate : AddAMealDelegate?
    var selected =  Array<Item>()
    
    var items = [Item(name: "Chocolate", calories: 33.50),
    Item(name: "Baunilha", calories: 35.22),
    Item(name: "Mussarela", calories: 70.0),
    Item(name: "Salsa", calories: 21.40),
    Item(name: "Maionese", calories: 40.50),
    Item(name: "Coconut Oil", calories: 12.23)]
    
    @IBOutlet var tableView : UITableView?
    
    func add(_ item: Item) {
        items.append(item)
        
        if let table = tableView{
            
            table.reloadData();

        }else{
            
            Alert(controller:self).show(message:"Unable to update items table")
            
        }
        
        
        
        
    }
    
    //Add button de forma programatica
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showNewItem))
        navigationItem.rightBarButtonItem = newItemButton;
    }
    
    //Func
    @objc func showNewItem(){
        
        let newItem = NewItemViewController(delegate: self)
        
        if let navigation = navigationController{
            
            navigation.pushViewController(newItem, animated: true)
            
        }else{
            
            Alert(controller:self).show()
            
        }
        
    }
    
    
    //Retorna o número de linha da tabela
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return items.count
    }
    
    //Insere valores na tabela
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell  = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = items[row].name
        

        
        return cell
        
    }
    

    
    
    //Insere check na tabela
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath){
            tableView.deselectRow(at: indexPath, animated: true)
            if(cell.accessoryType == UITableViewCell.AccessoryType.none){
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                let item = items[indexPath.row]
                selected.append(item)
            }
            else{ //Remover check da tabela
                 cell.accessoryType = UITableViewCell.AccessoryType.none
                 let item = items[indexPath.row]
                if let position = selected.firstIndex(of: item){ //Remover do array forma correta
                    selected.remove(at: position)
                }else{
                    
                    Alert(controller:self).show()
                    
                }
                
            }
        }else{
            
            Alert(controller:self).show()
            
        }
        
    }
    
    
    func convertToInt(_ text:String?) -> Int?{
        
        if let number = text{
            return Int(number)
            
        }
        return nil
        
    }
    
    
    func getMealFromForm()-> Meal? {
        
        if let name = foodField?.text{
            if let happiness = convertToInt(happinessField?.text){
                let meal = Meal(name: name, happiness: happiness, items:selected)
                
                print("Hi I eaten \(meal.name) and My Happinness after eat is \(meal.happines) with \(meal.items)")
                return meal
                
                
            }
            
            
        }
        
   
        return nil
    }
  
    
    @IBAction func addFood(){
        
      
            //Delegate que retorna valor para adicionar na tabela
        if let meal = getMealFromForm(){
            if let meals = delegate {
                meals.add(meal)
                //Voltar para tela anterior
                if let navigation = navigationController{
                    
                    navigation.popViewController(animated: true)
                    
                } else{
                    Alert(controller: self).show(message: "Unable to go back, but the meal was added");
                    
                }
            }
            return
        }
         Alert(controller: self).show()
            
        }
        
    
    

    
    


}

