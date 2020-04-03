 //
//  Helper.swift
//  DouyinDemo
//
//  Created by zainguo on 2019/11/13.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation
 
extension Int {
    var toWanStr: String {
        if self > 10000 {
            let a = Double(exactly: self)! / 10000.0
            // 对小数取整数四舍五入
            return round(a).description + "w"
        }
        return self.description
    }

    
   
}
