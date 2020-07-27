//
//  main.swift
//  KVO
//
//  Created by zainguo on 2019/8/6.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation


@objcMembers class User: NSObject {
    dynamic var email: String?
    init(email: String) {
        self.email = email
    }
}

let user = User(email: "xxxxx@163.com")

let observation = user.observe(\.email, options: [.new, .old]) { (user, change) in
    
    let newValue = change.newValue as? String
    let oldValue = change.oldValue as? String
    
    print("newValue: \(newValue!), oldValue: \(oldValue!)")

    print("User new email: \(user.email!)")
}

user.email = "user@163.com"
