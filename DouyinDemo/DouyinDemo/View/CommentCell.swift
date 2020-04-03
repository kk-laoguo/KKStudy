//
//  CommentCell.swift
//  DouyinDemo
//
//  Created by zainguo on 2019/12/10.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit
import Kingfisher

class CommentCell: UITableViewCell {
    
    // 点赞数量变化检测
    var likeCount: Int = 0 {
        didSet {
            disggsCountLabel.text = likeCount.toWanStr
        }
    }
    var likeTapped: Bool = false {
        didSet {
            if likeTapped {
                likeCount += 1
             } else {
                likeCount -= 1
            }
        }
    }
    var comment: Comment! {
        didSet {
            setupUI()
        }
        
    }
    
    @IBOutlet weak var avatarBtn: UIButton!
    @IBOutlet weak var likesBtn: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentTextLabel: UILabel!
    @IBOutlet weak var createTimeLabel: UILabel!
    @IBOutlet weak var disggsCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func likeBtnClick(_ sender: UIButton) {
        likeTapped.toggle()
    }
    func setupUI() {
        let avaterUrl = URL(string: comment.user.avatar_thumb.url_list[0])!
        avatarBtn.kf.setImage(with: avaterUrl, for: .normal)
        userNameLabel.text = comment.user.nickName
        likeCount = comment.digg_count
        let interval = Date().timeIntervalSince1970 - Double(exactly: comment.create_time)!
        createTimeLabel.text = interval.timeAgoDisplay()
        commentTextLabel.text = comment.text
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
