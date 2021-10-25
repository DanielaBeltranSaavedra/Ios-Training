import UIKit

//ex3

// function with 2 guard statements
func printIfPositiveInteger(number: String) {
    guard let value = Int(number) , value > 0 else {
        return
    }
    guard value > 0 else {
        return
    }
    print(value)
}

printIfPositiveInteger(number: "abc")

printIfPositiveInteger(number: "-10")

printIfPositiveInteger(number: "10")


//function with 1 compound guard statement.
func printIfPositiveInteger2(number: String) {
    guard let value = Int(number) , value > 0 else {
        return
    }
    print(value)
}

printIfPositiveInteger2(number: "abc")

printIfPositiveInteger2(number: "-10")

printIfPositiveInteger2(number: "10")




