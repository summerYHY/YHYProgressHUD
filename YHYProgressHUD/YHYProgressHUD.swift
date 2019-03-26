//
//  YHYProgressHUD.swift
//  YHYProgressHUD
//
//  Created by Summer on 2018/10/10.
//  Copyright © 2018年 YLT. All rights reserved.
//

import UIKit

class YHYProgressHUD: MBProgressHUD {

    static let shareyHYProgressHUD = YHYProgressHUD()
    
    func showmessageHUD(mesg:String)  {
        let view = UIApplication.shared.windows.last
        let hud = MBProgressHUD.showAdded(to: view! , animated: true)
        hud.detailsLabel.text = mesg
        self.configLightHud(HUD: hud)
        hud.customView = self.customView
        hud.mode = MBProgressHUDMode.customView
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 2)
    }
    
    func showLoadingImageAndTitle(title: String) -> MBProgressHUD{
        let view = UIApplication.shared.keyWindow
        let hud = MBProgressHUD.showAdded(to: view!, animated: true)
        hud.label.text = title
        hud.customView = self.customeView()
       
        self.configHUD(HUD: hud)
        hud.mode = MBProgressHUDMode.customView
        hud.removeFromSuperViewOnHide = true
        return hud
        
    }
    
    func hideHUDForView()  {
        let view  = UIApplication.shared.keyWindow
        MBProgressHUD.hide(for: view!, animated: true)
        
    }
    
    //pragma MARK:_______________私有化方法
   private func configHUD(HUD:MBProgressHUD)  {
        HUD.backgroundColor = UIColor.clear
        HUD.bezelView.color = UIColor.init(red: 0, green: 1, blue: 0, alpha: 0.3)
        HUD.bezelView.style = MBProgressHUDBackgroundStyle.solidColor
        HUD.tintColor = UIColor.black
        HUD.detailsLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
   private func configLightHud(HUD:MBProgressHUD) {
        HUD.backgroundColor = UIColor.clear
        HUD.tintColor = UIColor.black
        HUD.detailsLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
   private func customeView () -> UIImageView {
        var imageArray: Array  = Array<UIImage>.init()
        for i in 1...4 {
            let iamge = UIImage.init(named:String.init(format: "loading_0%d", i))
            imageArray.append(iamge!)
        }
        let imageView  = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 10, height: 10))
        imageView.animationImages = imageArray
        imageView.animationDuration = 0.4
        imageView.startAnimating()
        return imageView
        
    }
    
    
}
