enum PossibleErrors: Error {
  case notInStock
  case notEnoughMoney
}

struct Drink {
  let price: Int
  var count: Int
}


class Fridge {

  var deposit = 11
  var drinksInFridge = ["Pepsi": Drink(price: 10, count: 1), "Lipton": Drink(price: 11, count: 0), "Mirinda": Drink(price: 12, count: 3)]
  
  
  func getTheDrink(withName: String) throws {
    guard var drink = drinksInFridge[withName] else {
      throw PossibleErrors.notInStock
    }
    
    guard drink.count > 0 else {
      throw PossibleErrors.notInStock
    }
    
    guard drink.price <= deposit else {
      throw PossibleErrors.notEnoughMoney
    }
    
    deposit -= drink.price
    drink.count -= 1
    drinksInFridge[withName] = drink
    print("You got the Drink: \(withName)")
    
  }
}

let fridge = Fridge()
try? fridge.getTheDrink(withName: "Pepsi")
fridge.deposit
fridge.drinksInFridge

do {
  try fridge.getTheDrink(withName: "Pepsi")
} catch PossibleErrors.notInStock {
  print("Drink is not in stock")
} catch PossibleErrors.notEnoughMoney {
  print("Not enough money")
}
