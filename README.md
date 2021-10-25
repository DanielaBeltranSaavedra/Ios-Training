Exercise 1:

Given the variable distance: 

let distance: UInt = 10 

Write a switch using interval matching that... 

Prints "Here" if distance is 0. 

Prints "Immediate vicinity" if distance is less than 5 but more than 0.

Prints "Near" if distance is between 5 and 15, including 15. 

Prints "Kind of far" if distance is more than 15 and less or equal to 40.

Prints "Far" if distance exceeds 40.

 

Exercise 2:

Write a function that receives 2 params, first is an array of integers and the second an integer number. The function should print the count of numbers inside the array that are lower or greater than the second param.

For example: 

Array is: [110, 20, 100, 0, 200]

Int number is: 100

Result:

“There are 2 numbers lower and 2 greater than 100”

 

Exercise 3:

Rewrite the following function using guard statements. You can use 2 guard statements or 1 compound guard statement. Actually, try both. :-) 

func printIfPositiveInteger(number: String) { 

    if let value = Int(number) { 

        if value > 0 { 

            print(value) 

        } 

    } 

}

printIfPositiveInteger(number: "abc") 

printIfPositiveInteger(number: "-10") 

printIfPositiveInteger(number: "10")
