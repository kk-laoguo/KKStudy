//
//  ViewController.swift
//  DouyinDemo
//
//  Created by zainguo on 2019/10/26.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController {

    @IBOutlet weak var lodingView: NVActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var awemeList = [AwemeList]()
    var videojsonIndex = 12
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lodingView.startAnimating()
        getList()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    func getList() {
        let url = URL(string: DouyinURL.baseLocal + videojsonIndex.description + DouyinURL.feedFile)!
        getAweList(url: url)
    }
    func getAweList(url: URL) {
        do {
            let feed = try Feed(fromURL: url)
            if let awemeList = feed.awemeList {
                self.awemeList += awemeList
                self.lodingView.stopAnimating()
                self.tableView.reloadData()
            }
        } catch {
            self.lodingView.stopAnimating()
            debugPrint("解析错误")
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        awemeList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
//        cell.textLabel?.text = awemeList[indexPath.row].desc
        cell.aweme = awemeList[indexPath.row]
        
        return cell
    }
    // 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
     // 拖动结果
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        videojsonIndex -= 1
        getList()
        currentPage = tableView.indexPathsForVisibleRows?.last?.row ?? 0
    }
}

