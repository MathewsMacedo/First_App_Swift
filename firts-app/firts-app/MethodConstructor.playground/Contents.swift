import UIKit
//AULA 5
class Meal{
    
    var happiness:Int = 5
    var name:String = "Eggplant Brownie"
    var items = Array<Item>()
    
    init(name:String,happinness:Int){
        
        self.name = name
        self.happiness = happinness
        
    }
    
    func totalCal() -> Double{
        var result = 0.0
        for cal in self.items{
            
            result += cal.calories
            
        }
        
        return result
    }
    
}


class Item{
    
    var name:String
    var calories:Double
    
    init(name:String, calories:Double){
        self.name = name
        self.calories = calories
        
        
    }
    
}


let item1 = Item(name: "massa", calories: 50.5)

let item2 = Item(name: "carne", calories: 32.5)

let lasanha = Meal(name: "Lasanha", happinness: 5)

lasanha.items.append(item1);
lasanha.items.append(item2);

print("All Calories: ",lasanha.totalCal())
