//
//  Meal.swift
//  firts-app
//
//  Created by Matheus on 16/08/19.
//  Copyright © 2019 iCasei. All rights reserved.
//

import Foundation



class Meal{
    
    let name:String
    let happines:Int
    let items:Array<Item>
    
    //Metodo Construtor
    init (name:String,happiness:Int, items: Array<Item>){
        
        self.name = name
        self.happines = happiness
        self.items = items
        
        
    }
    
    init (name:String,happiness:Int){
        
        self.name = name
        self.happines = happiness
        self.items = []
    }
    
    
    func allCalories() -> Double{
        
        var result = 0.0
        
        for cal in items{
            
            result += cal.calories
            
        }
        
        return result
        
    }
    
    
    func details() -> String{
        
        var message = "Happiness: \(happines)\n"
        
        for item in items{
            
            message += "\nItems: \(item.name) - Calories: \(item.calories)"
            
        }
        
        return message
        
    }
    
   
}
