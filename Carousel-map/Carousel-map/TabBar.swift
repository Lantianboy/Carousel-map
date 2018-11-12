//
//  TabBar.swift
//  test
//
//  Created by 张文超 on 2018/11/6.
//  Copyright © 2018年 张文超. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.creatSubViewController()
        // Do any additional setup after loading the view.
    }
    
    
    func creatSubViewController(){
        
        let firstVC = ViewController()
        firstVC.title = "摄像机"
        let nav1 = UINavigationController(rootViewController: firstVC)
        nav1.tabBarItem.title = "摄像机"
        nav1.tabBarItem.image = UIImage(named: "Image")
        
        let secondVC = ViewController1()
        secondVC.title = "事件"
        let nav2 = UINavigationController(rootViewController: secondVC)
        nav2.tabBarItem.image = UIImage(named: "more")
        
        let thrid = ViewController2()
        thrid.title = "新增摄像机"
        let nav3 = UINavigationController(rootViewController: thrid)
        nav3.tabBarItem.image = UIImage(named: "menu")
        
        let four = ViewController3()
        four.title = "资讯"
        let nav4 = UINavigationController(rootViewController: four)
        nav4.tabBarItem.image = UIImage(named: "person")
        
        tabBar.tintColor = UIColor.orange
        let tabBarAry = [nav1,nav2,nav3,nav4]
        self.viewControllers = tabBarAry
        
        
        
        
        
        
    }
    
   

}
