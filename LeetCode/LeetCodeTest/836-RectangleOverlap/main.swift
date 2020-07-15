//
//  main.swift
//  836-RectangleOverlap
//
//  Created by zainguo on 2020/3/18.
//  Copyright © 2020 zainguo. All rights reserved.
//

import Foundation

class Solution {
    
    func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
        
        let x_overlap = rec2[0] >= rec1[2] || rec1[0] >= rec2[2]
        let y_overlap = rec2[1] >= rec1[3] || rec1[1] >= rec2[3]
        return !x_overlap && !y_overlap
    }

}


