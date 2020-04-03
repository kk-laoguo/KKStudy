//
//  VideoCell.swift
//  DouyinDemo
//
//  Created by zainguo on 2019/11/13.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit
import MarqueeLabel
import Kingfisher
import ChainableAnimations

class VideoCell: UITableViewCell {
    
    var animator1: ChainableAnimator!
    var animator2: ChainableAnimator!
 
    var aweme: AwemeList! {
        didSet {
            labelAuthor.text = aweme.author?.nickname
            labelDesc.text = aweme.desc
            
            // 设置视图封面图
            let cover = aweme.video!.cover!.urlList!.first
            let coverUrl = URL(string: cover!)
            coverImageView.kf.setImage(with: coverUrl)
            // 设置音乐标题
            labelMusic.text = aweme.music!.title! + "-" + aweme.music!.author!
            labelMusic.restartLabel()
            
            // 作者头像
            let authorAvator = aweme.author!.avatarThumb!.urlList!.first
            let avatarUrl = URL(string: authorAvator!)
            followBtn.kf.setImage(with: avatarUrl, for: .normal)
//            followBtn.layer.cornerRadius = 25
//            followBtn.clipsToBounds = true
            
            // 点赞 评论 转发
            lableLikeNum.text = aweme.statistics!.diggCount!.toWanStr
            labelCommentNum.text = aweme.statistics!.commentCount!.toWanStr
            lableShareNum.text = aweme.statistics!.shareCount!.toWanStr
            
            // 音乐封面
            let musicCover = aweme.music!.coverThumb!.urlList!.first
            musicCoverImageView.kf.setImage(with: URL(string: musicCover!))
            
            animator2 = ChainableAnimator(view: subDiskView)
            animator2.rotate(angle: 180).animateWithRepeat(t: 3.5, count: 50)
            
            
            // 音符散发效果
            diskView.raiseAnimate(imageName: "icon_home_musicnote1", delay: 0)
            diskView.raiseAnimate(imageName: "icon_home_musicnote2", delay: 1)
            diskView.raiseAnimate(imageName: "icon_home_musicnote1", delay: 2)

        
            
        }
    }
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var pauseImageView: UIImageView!
    
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelMusic: MarqueeLabel!
    
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var addFollowBtn: UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var lableLikeNum: MarqueeLabel!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var labelCommentNum: MarqueeLabel!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var lableShareNum: MarqueeLabel!
    
    @IBOutlet weak var diskView: UIView!
    @IBOutlet weak var subDiskView: UIView!
    @IBOutlet weak var musicCoverImageView: UIImageView!
    @IBOutlet weak var rotateDiskView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        // 重置关注按钮的所有动画效果
        if animator1 != nil {
            animator1.stop()
            addFollowBtn.transform = .identity
            addFollowBtn.layer.removeAllAnimations()
            addFollowBtn.setImage(UIImage(named: "icon_personal_add_little"), for: .normal)
        }
        diskView.resetViewAnimation()
//        if animator2 != nil {
//            animator2.stop()
//
//        }
    }

    @IBAction func addFollowTap(_ sender: UIButton) {
        
        animator1 = ChainableAnimator(view: sender)
        UIView.transition(with: sender,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
                        sender.setImage(UIImage(named: "iconSignDone"), for: .normal)

        }) { (_) in
            self.animator1.rotate(angle: 360)
                .thenAfter(t: 0.6)
                .wait(t: 0.3)
                .transform(scale: 0)
                .animate(t: 0.2)
        }
     
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
