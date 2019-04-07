//
//  main.swift
//  calc
//


import Foundation

var opsLow:[String] = ["+","-"]
var opsHigh:[String] = ["x","/","%"]

var args = CommandLine.arguments
args.removeFirst() // remove the name of the program

var result:Int = 0


func calResult(highOP:String, index:Int, numbers:[String]) -> [String] {
    var tmpArgs:[String] = numbers
    let num1:Int = Int(numbers[index])!
    let num2:Int = Int(numbers[index + 1])!
    var tmpResult:Int = 0
    tmpArgs.remove(at: index)
    tmpArgs.remove(at: index)
    
    switch highOP {
    case "x":
        tmpResult = num1 * num2
    case "/":
        tmpResult = num1 / num2
    case "%":
        tmpResult = num1 % num2
    default:
        tmpResult = 0
    }
    tmpArgs.insert(String(tmpResult), at: index)
    return tmpArgs
}


func calResult(lowOP:String, index:Int, numbers:[String]) -> [String] {
    var tmpArgs:[String] = numbers
    let num1:Int = Int(numbers[index])!
    let num2:Int = Int(numbers[index + 1])!
    var tmpResult:Int = 0
    tmpArgs.remove(at: index)
    tmpArgs.remove(at: index)
    
    switch lowOP {
    case "+":
        tmpResult = num1 + num2
    case "-":
        tmpResult = num1 - num2
    default:
        tmpResult = 0
    }
    tmpArgs.insert(String(tmpResult), at: index)
    return tmpArgs
}

if (args.count > 0) {
    
    if (args.count == 1) {
        result = Int(args.first!)!
        print(result)
    } else {
        var numbers:[String] = [String]()
        var op:[String] = [String]()
        
       
        for (n, c) in args.enumerated() {
            if (n % 2 == 1) {
                op.append(c)
            } else {
                numbers.append(c)
            }
        }
        
        var lowCount:Int = 0
        var highCount:Int = 0
        
        
        for c in op {
            if (opsLow.contains(c)) {
                lowCount += 1
            } else if (opsHigh.contains(c)) {
                highCount += 1
            } else {
                exit(1)
            }
        }
        
        
        while (op.count > 0 && highCount > 0) {
            for (n, c) in op.enumerated() {
                if (opsHigh.contains(c)) {
                    numbers = calResult(highOP: c, index: n, numbers: numbers)
                    op.remove(at: n)
                    highCount -= 1
                    break
                }
            }
        }
        
        
        while (op.count > 0 && lowCount > 0) {
            for (n, c) in op.enumerated() {
                if (opsLow.contains(c)) {
                    numbers = calResult(lowOP: c, index: n, numbers: numbers)
                    op.remove(at: n)
                    lowCount -= 1
                    break
                }
            }
        }

        
        result = Int(numbers.first!)!
        print(result)
    }
}





