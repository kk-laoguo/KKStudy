//
//  DouyinNetwork.swift
//  DouyinDemo
//
//  Created by zainguo on 2019/10/26.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation
import Just

struct DouyinURL {
    
//    http://127.0.0.1:5500/12feed.json
    static let baseLocal = "http://127.0.0.1:5500/"
    static let feedFile = "feed.json"
    static let commentLocal = URL(string: baseLocal + "/comment/xsy.json")!
    
}

typealias Success = () -> Void
typealias SuccessWithJson = (Any?) -> Void

struct DouyinNetwork {
    static let ERR = "json获取错误"
    
    // 获取本地评论的Json
    static func getComment(success: @escaping SuccessWithJson) {
        DouyinNetwork.getJson(url: DouyinURL.commentLocal, success: success)
    }
    
    static func getJson(url: URL, success: @escaping SuccessWithJson) {
        Just.get(url) { (r) in
            if r.ok {
                success(r.content)
            } else {
                debugPrint(DouyinNetwork.ERR, r.reason)
            }
        }
    }
}
