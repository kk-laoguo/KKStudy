//
//  User.swift
//  DouyinDemo
//
//  Created by zainguo on 2019/11/30.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation


struct User: Codable {
    var nickName: String
    var avatar_thumb: Avatar_thumb
    
    
    
}

struct Avatar_thumb: Codable {
    var url_list: [String]
    
}
