//
//  Comment.swift
//  DouyinDemo
//
//  Created by zainguo on 2019/11/30.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation

// 评论
struct Comment: Codable {
    var text: String
    var digg_count: Int
    var create_time: Int
    var user: User
    var reply_comment: [Comment]?
}

// 评论数
struct Comments: Codable {
    var comments: [Comment]
}
