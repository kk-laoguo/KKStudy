//
//  CommentController.swift
//  DouyinDemo
//
//  Created by zainguo on 2019/12/2.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit

class CommentController: UIViewController {
    @IBOutlet weak var commentAreaView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCommentData()
    }
    func getCommentData() {
        DouyinNetwork.getComment { (r) in
            debugPrint(r)
        }
    }
    
    @IBAction func tapToClose(_ sender: UITapGestureRecognizer) {
        // 单击手势点击时相对于评论View的位置
        let tapPoint = sender.location(in: commentAreaView)
        if !commentAreaView.layer.contains(tapPoint) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func tapClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension CommentController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath)
        return cell
    }
}
