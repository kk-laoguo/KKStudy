//
//  main.swift
//  365-WaterAndJugProblem
//
//  Created by zainguo on 2020/3/21.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation




func canMeasureWater(_ x: Int, _ y: Int, _ z: Int) -> Bool {
    
    if x + y < z {
        return false
    }
    if x == z || y == z || x + y == z {
        return true
    }
    if x == 0 && y == z {
        return true
    }
    return z % gcd(x, y) == 0
}


func gcd(_ x: Int, _ y: Int) -> Int {
    return x % y = 0 ? y:gcd(y, x % y)
    
}


