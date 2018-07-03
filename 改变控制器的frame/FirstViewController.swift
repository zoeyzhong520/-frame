//
//  FirstViewController.swift
//  改变控制器的frame
//
//  Created by ZZJ on 2018/7/3.
//  Copyright © 2018年 ZZJ. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController {
    
    lazy var subView:SubView = {
        let subView = SubView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 273))
        return subView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .red
    
        self.view.addSubview(self.subView)
        
        self.addRefresh()
    }

    func addRefresh() {
        self.subView.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: { [weak self] in
            if self?.subView.tableView.mj_header.isRefreshing == true {
                self?.subView.tableView.mj_header.endRefreshing()
            }
        })
        
        let footer = MJRefreshAutoNormalFooter.init { [weak self] in
            if self?.subView.tableView.mj_footer.isRefreshing == true {
                self?.subView.tableView.mj_footer.endRefreshing()
            }
        }
        self.subView.tableView.mj_footer = footer
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.subView.tableView.mj_header.beginRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        self.view.frame = CGRect(x: 0, y: 273, width: ScreenWidth, height: ScreenHeight - 273)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
