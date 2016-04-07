//
//  main.swift
//  SimpleCalc
//
//  Created by Evan on 3/31/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import Foundation


let one: String = readLine(stripNewline: true)!

func convert(incoming:String) -> Int {
    let int: Int? = Int(incoming)
    return int!
}

func analysis(incoming:String) -> Int {
    //do shit here
    let arr = incoming.componentsSeparatedByString(" ")
    
    if arr.count > 1 {
        return boil(arr)
        //do anal about the special thing they plugged in
    } else {
        let op: String = readLine(stripNewline: true)!
        
        let two: String = readLine(stripNewline: true)!
        
        let num = convert(two)
        
        return calc(convert(arr[0]), second: num, sign: op)
    
    }
}

func calc(first:Int, second:Int, sign:String) -> Int {
    //add sub mul div mod
    if sign == "+" {
        return first + second
    } else if sign == "-" {
        return first - second
    } else if sign == "*" {
        return first * second
    } else if sign == "/" {
        return first / second
    } else if sign == "%" {
        return first % second
    } else {
        return 0
    }
}

func boil(arr:[String]) -> Int {
    let op = arr[arr.count - 1]
    if op == "count" {
        return arr.count - 1
    } else if op == "avg" {
        var sum = 0
        for i in 0 ... arr.count - 2 {
           sum += convert(arr[i])
        }
        return sum / (arr.count - 1)
    } else if arr.count == 2 && op == "fact" {
        var start = convert(arr[0])
        var total = start
        start -= 1
        while start > 0 {
            total *= start
            start -= 1
        }
        return total
    } else {
        return 0
    }
}

print(analysis(one))
