import UIKit

// ex1
let distance: UInt = 41

switch distance{
case 0: print("Here")
case 1...5: print("Immediate vicinity")
case 5...15: print("Near")
case 15...40: print("Kind of far")
case 40...: print("Far")
default: print("The number is less than zero");<#code#>
}

//ex2

func countLessGreater(myArr: [Int], number: Int) {
    
    let lessNum = myArr.filter{$0 < number}.count
    let greaterNum = myArr.filter{$0 > number}.count
    print("There are ",lessNum ," numbers lower and ", greaterNum, " greater than 100")
      
}
countLessGreater(myArr: [110, 20, 100, 0, 200], number:100)
