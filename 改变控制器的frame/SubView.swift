//
//  SubView.swift
//  改变控制器的frame
//
//  Created by ZZJ on 2018/7/3.
//  Copyright © 2018年 ZZJ. All rights reserved.
//

import UIKit

class SubView: UIView {

    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellID")
        tableView.rowHeight = 30
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        
        self.backgroundColor = UIColor.white
        
        self.addSubview(self.tableView)
        self.tableView.reloadData()
    }
}

extension SubView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = "改变控制器的frame"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.textLabel?.textColor = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}













