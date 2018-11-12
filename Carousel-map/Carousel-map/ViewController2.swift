//
//  ViewController2.swift
//  test
//
//  Created by 张文超 on 2018/11/6.
//  Copyright © 2018年 张文超. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    let imageNames = ["timg.jpeg","timg-2.jpeg","timg-3.jpeg","timg-4.jpeg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        creatScrollView()
        
        print(self.navigationController?.navigationBar.frame.size.height)
        print(UIApplication.shared.statusBarFrame.size.height)
        
        
    }
    
    override func loadView(){
        super.loadView()
        //设置y从导航栏下开始
        self.edgesForExtendedLayout = .bottom
    }
    
    func creatScrollView(){
        let scr = MyScrollView()
        
        
        scr.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300)
        //调用方法 传入图片数组和轮播图高度
        scr.creatMyScrollView(imageMut: imageNames, imageHeight: 240)
        self.view.addSubview(scr)
        
    }
    
    
    
}
