//
//  Time.swift
//  DouyinDemo
//
//  Created by zainguo on 2019/12/10.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation

extension TimeInterval {
    func timeAgoDisplay() -> String {
        let secondAgo = Int(self)
        if secondAgo >= 86400 * 2 {
            return "\(((secondAgo / 60) / 60) / 24)天前"
        } else if secondAgo >= 86400 {
            return "1天前"
        } else if secondAgo > 7200 {
            return "1小时前"
        } else if secondAgo >= 3600 {
            return "\((secondAgo / 60) / 60)小时前"
        } else if secondAgo < 60 {
            return "刚刚"
        } else if secondAgo > 119 {
            return "\(secondAgo / 60)分钟前"
        }
        return "1分钟前"
    }
}
