//
//  ViewController.swift
//  改变控制器的frame
//
//  Created by ZZJ on 2018/7/3.
//  Copyright © 2018年 ZZJ. All rights reserved.
//

import UIKit

public let ScreenWidth = UIScreen.main.bounds.size.width
public let ScreenHeight = UIScreen.main.bounds.size.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "首页"
        self.view.backgroundColor = UIColor.white
        
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 0, y: 100, width: ScreenWidth, height: 30)
        btn.setTitle("跳转", for: .normal)
        btn.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func clickAction() {
        
        self.navigationController?.pushViewController(SubViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

