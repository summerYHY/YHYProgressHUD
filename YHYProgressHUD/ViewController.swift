//
//  ViewController.swift
//  YHYProgressHUD
//
//  Created by Summer on 2018/10/10.
//  Copyright © 2018年 YLT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }
    override func viewDidAppear(_ animated: Bool) {
    
      
       let  start = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 29))
        start.setTitle("加载动画3秒后结束", for: .normal)
        start.backgroundColor = UIColor.red
        start.center = self.view.center
        start.addTarget(self, action: #selector(startClick), for: .touchUpInside)
        self.view.addSubview(start)
        
        
        let  message = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 29))
        message.setTitle("展示文字", for: .normal)
        message.backgroundColor = UIColor.red
        message.center.x = start.center.x
        message.center.y = start.center.y + 100
        message.addTarget(self, action: #selector(messageClick), for: .touchUpInside)
        self.view.addSubview(message)
        
    }
    
    @objc func startClick() {
        let _ = YHYProgressHUD.shareyHYProgressHUD.showLoadingImageAndTitle(title: "加载中...")
        self.timer = Timer.scheduledTimer(timeInterval:3, target: self, selector: #selector(endAnmaint), userInfo: nil, repeats: true)
        
    }
    
    @objc func endAnmaint()  {
        self.timer?.invalidate()
        self.timer = nil
        YHYProgressHUD.shareyHYProgressHUD.hideHUDForView()
    }
    
    @objc func messageClick()  {
        YHYProgressHUD.shareyHYProgressHUD.showmessageHUD(mesg: "提示文字")
    }
    
    
    

  
    

    

}

