//
//  main.swift
//  FirstCourseSecondTask
//
//  Copyright © 2017 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


let checker = Checker()

func firstFunction (Arr: [Int]) -> (Int, Int){
    var evenNumbers: Int = 0
    var oddNumbers: Int = 0
    for i in 0...Arr.count-1{
        if Arr[i]%2 == 0 {
            evenNumbers += 1
        }
        else {
            oddNumbers += 1
        }
    }
    return (evenNumbers, oddNumbers)
}


checker.checkFirstFunction(function: firstFunction)

func secondFunction (circles: [Checker.Circle]) -> [Checker.Circle]{
    var copyCircles: [Checker.Circle] = circles
    var whiteCirclesArr = [Checker.Circle]()
    var i = 0
    while i < copyCircles.count {
        if copyCircles[i].color == Checker.Color.white {
            whiteCirclesArr.append(copyCircles.remove(at: i))
        }
        else {
            i += 1
        }
    }
    
    copyCircles = whiteCirclesArr + copyCircles
    for j in 0...copyCircles.count-1{
        if copyCircles[j].color == Checker.Color.black {
            copyCircles[j].radius *= 2
        }
        else if copyCircles[j].color == Checker.Color.green {
            copyCircles[j].color = Checker.Color.blue
        }
    }
    var blueCirclesArr = [Checker.Circle]()
    i = 0
    while i < copyCircles.count {
        if copyCircles[i].color == Checker.Color.blue {
            blueCirclesArr.append(copyCircles.remove(at: i))
        }
        else{
            i += 1
        }
    }
    copyCircles += blueCirclesArr
    i = 0
    while i < copyCircles.count {
        if copyCircles[i].color == Checker.Color.red {
            copyCircles.remove(at: i)
        }
        else {
            i += 1
        }
    }
    return copyCircles
}
checker.checkSecondFunction(function: secondFunction)


func thirdFunction (arrEmployeeData: [Checker.EmployeeData]) -> [Checker.Employee]{
    var arrEmployee = [Checker.Employee]()
    for i in 0..<arrEmployeeData.count{
        guard arrEmployeeData[i].count == 3 else {continue}
        guard let fullName = arrEmployeeData[i]["fullName"] else { continue }
        guard let salary = arrEmployeeData[i]["salary"] else {continue}
        guard let company = arrEmployeeData[i]["company"] else {continue}
        let emp = Checker.Employee(fullName: fullName, salary: salary, company: company)
        arrEmployee.append( emp )
    }
    return arrEmployee
}

checker.checkThirdFunction(function: thirdFunction)


func fourthFunction ( arrNames: [String] ) -> [String : [String]] {
    var dictNames = Dictionary <String,[String]>()
    for i in 0..<arrNames.count{
        if !dictNames.keys.contains(String(arrNames[i][arrNames[i].startIndex])){
            dictNames[String(arrNames[i][arrNames[i].startIndex])] = [arrNames[i]]
        }
        else{
            guard var newArrDict: [String] = dictNames[String(arrNames[i][arrNames[i].startIndex])] else { continue }
            newArrDict.append(arrNames[i])
            dictNames.updateValue(newArrDict, forKey: String(arrNames[i][arrNames[i].startIndex]))
        }
    }
    for (word,names) in dictNames{
        if names.count < 2{
            dictNames[word] = nil
        }
        else {
            guard var newArrDict: [String] = dictNames[word] else {continue}
            newArrDict.sort()
            newArrDict.reverse()
            dictNames.updateValue(newArrDict, forKey: word)
        }
    }
    return dictNames
}

checker.checkFourthFunction(function: fourthFunction)
