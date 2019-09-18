import UIKit

//Using Variable 2Aula 3AULA 4AULA
let foodName = "Lasanha"
let happiness = 5
let calories = 50.7
let foodIsVegetable = false
let goodOrNo:Bool = true


//Using Function
func helloCalories(){
    let product = "Potato"
    print("Hello \(product)");
    
}

helloCalories()

func add(foodName:String,happiness:Int,calories:Double){
    
    print("You need to eat \(foodName) for you take happy \(happiness), but you will get more calories: \(calories) ")
}

add(foodName: "Bala de Goma", happiness: 4, calories: 3.5)
add(foodName: "Fresh Potato", happiness: 5, calories: 99.9)

//Funcao sem rotulo ao chamar (Acrescentar Underline and Space before variable)
func oi(_ diga:String, sim:String){
    print("\(diga) \(sim)")
    
}
oi("\n\n**Alguma coisa legal",sim:"Ola\n\n") //Concat


//Using lace For and Foreach
let caloriesArray = [10,50.5,800,99.9]
print(caloriesArray)
print("Print Using For \n")
for i in 0...(caloriesArray.count-1){
    
    print("\(caloriesArray[i]) Array Index \(i)")
    
    
}

print()
print("Print Using Foreach \n")
for item in caloriesArray{
    
    print(item)
    
    
}


//Array erro e solucao

//let empty:Array<Int> = []

func allCalories(calories:Array<Double>) -> Double{
    
    var total:Double = 0.0 //Inplicito ou Explicito se não ocorre erro
    for item in calories{
        
        total += item
        
    }
    return total
}
print(Double(0+8)) //Convert
print(allCalories(calories: caloriesArray))

//Teste erro e corrigido
var notas = [9, 6.5, 4, 8.25]
var soma = 0.0 //Inplicity declaration Double
for nota in notas {
    soma += nota
}
print(soma / Double(notas.count)) //Count is int


//Instancia de Objeto
class Meal{
    
    var food = "Lasanha"
    var happiness = 5
    var flavor:String?
    
}

let lasanha = Meal()
print(lasanha.food)
lasanha.food = "LASANHA"
print(lasanha.food.lowercased())
lasanha.flavor = "Bolonhesa"
if let name = lasanha.flavor{
print(lasanha.food,name.uppercased())
}


let idade = Int("34")
