import UIKit

//ex2

func countLessGreater(myArr: [Int], number: Int) {
    
    let lessNum = myArr.filter{$0 < number}.count
    let greaterNum = myArr.filter{$0 > number}.count
    print("There are ",lessNum ," numbers lower and ", greaterNum, " greater than 100")
      
}
countLessGreater(myArr: [110, 20, 100, 0, 200], number:100)
