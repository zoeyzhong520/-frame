//
//  SubViewController.swift
//  改变控制器的frame
//
//  Created by ZZJ on 2018/7/3.
//  Copyright © 2018年 ZZJ. All rights reserved.
//

import UIKit

fileprivate let btnW:CGFloat = ScreenWidth / 4
fileprivate let btnH:CGFloat = 30
fileprivate let marigin:CGFloat = (ScreenWidth - 25*2 - 44*4)/3

class SubViewController: UIViewController {

    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 273)
        imageView.backgroundColor = UIColor.lightGray
        return imageView
    }()
    
    lazy var bottomLine:UIView = {
        let bottomLine = UIView()
        bottomLine.frame = CGRect(x: 25, y: 230, width: 44, height: 1)
        bottomLine.backgroundColor = UIColor.white
        return bottomLine
    }()
    
    var btnArray = [UIButton()]
    
    var firstViewController = FirstViewController()
    var secondViewController = SecondViewController()
    var thirdViewController = ThirdViewController()
    var fourthViewController = FourthViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "详情"
        
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(imageView)
        
        self.createButtons()
        
        //first 默认加载
        self.view.addSubview(fourthViewController.view)
        self.view.addSubview(thirdViewController.view)
        self.view.addSubview(secondViewController.view)
        self.view.addSubview(firstViewController.view)
        
        self.view.addSubview(self.bottomLine)
        
        self.createBackBtn()
    }

    //MARK: - 私有方法
    
    //返回按钮
    func createBackBtn() {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 100, width: ScreenWidth, height: 30)
        btn.setTitle("返回", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //按钮集
    func createButtons() {
        
        let btnNameArray = ["button1", "button2", "button3", "button4"]
        for i in 0..<btnNameArray.count {
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: btnW*CGFloat(i), y: 200, width: btnW, height: btnH)
            btn.setTitle(btnNameArray[i], for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.setTitleColor(.lightGray, for: .highlighted)
            btn.tag = i
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            btn.addTarget(self, action: #selector(clickAction(_:)), for: .touchUpInside)
            self.view.addSubview(btn)
            
            self.btnArray.append(btn)
        }
    }
    
    @objc func clickAction(_ button:UIButton) {
        for btn in self.btnArray {
            if btn.tag == button.tag {
                //当前选中的按钮
                UIView.animate(withDuration: 0.3, animations: {
                    self.bottomLine.frame = CGRect(x: 25+(44+marigin)*CGFloat(button.tag), y: 230, width: 44, height: 1)
                    self.createVC(button.tag)
                }, completion: nil)
            } else {
                //不执行操作
            }
        }
    }
    
    ///点击按钮切换控制器
    func createVC(_ tag:Int) {
        
        self.removeViewCotrollers(tag)
        
        switch tag {
        case 0:
            //first
            self.view.addSubview(firstViewController.view)
        case 1:
            //second
            self.view.addSubview(secondViewController.view)
        case 2:
            //third
            self.view.addSubview(thirdViewController.view)
        case 3:
            //fourth
            self.view.addSubview(fourthViewController.view)
        default:
            break
        }
    }
    
    //删除控制器
    func removeViewCotrollers(_ tag:Int) {
        
        switch tag {
        case 0:
            secondViewController.view.removeFromSuperview()
            thirdViewController.view.removeFromSuperview()
            fourthViewController.view.removeFromSuperview()
        case 1:
            firstViewController.view.removeFromSuperview()
            thirdViewController.view.removeFromSuperview()
            fourthViewController.view.removeFromSuperview()
        case 2:
            firstViewController.view.removeFromSuperview()
            secondViewController.view.removeFromSuperview()
            fourthViewController.view.removeFromSuperview()
        case 3:
            firstViewController.view.removeFromSuperview()
            secondViewController.view.removeFromSuperview()
            thirdViewController.view.removeFromSuperview()
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
        
        UIApplication.shared.statusBarStyle = .default
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
