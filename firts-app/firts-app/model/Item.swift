//
//  Item.swift
//  firts-app
//
//  Created by Matheus on 16/08/19.
//  Copyright © 2019 iCasei. All rights reserved.
//

import Foundation

class Item:Equatable{
   
    
    
    
    let name:String
    let calories:Double
    
    
    init (name:String,calories:Double){
        
        self.name = name
        self.calories = calories
        
    }
    
   
    
}

func ==(first:Item, second:Item) -> Bool {
    
    return first.name == second.name && first.calories == second.calories
}

