//
//  ViewController2.swift
//  test
//
//  Created by 张文超 on 2018/11/6.
//  Copyright © 2018年 张文超. All rights reserved.
//

import UIKit
import WebKit
class ViewController2: UIViewController,touchImagesDelegate {
    
    let imageNames = ["timg.jpeg","timg-2.jpeg","timg-3.jpeg","timg-4.jpeg"]
    let wkWebview = WKWebView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        creatScrollView()
        
        print(self.navigationController!.navigationBar.frame.size.height)
        print(UIApplication.shared.statusBarFrame.size.height)
        
        
        wkWebview.frame = CGRect(x: 0, y: self.view.frame.size.height/3 + 50, width: self.view.frame.size.width, height: self.view.frame.size.height/3)
//        wkWebview.backgroundColor = UIColor .red
        //充满 不写可能会出现显示问题
        wkWebview.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        
        
    }
    
    override func loadView(){
        super.loadView()
        //设置y从导航栏下开始
        self.edgesForExtendedLayout = .bottom
    }
    
    func creatScrollView(){
        let scr = MyScrollView()
        
        scr.delegate = self
        scr.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300)
        //调用方法 传入图片数组和轮播图高度
        scr.creatMyScrollView(imageMut: imageNames, imageHeight: self.view.frame.size.height/3)
        self.view.addSubview(scr)
        
    }
    
    func touchImages(urlStr:String){
//        let mapWarURL = URL(string: urlStr)!
//        let request = URLRequest(url: mapWarURL)
//        wkWebview.load(request)
        //加载网址
        wkWebview.load(URLRequest(url: URL(string: urlStr)!))
        self.view .addSubview(wkWebview)
    }
    
    
}
