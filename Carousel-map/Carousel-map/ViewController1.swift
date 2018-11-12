//
//  ViewController1.swift
//  test
//
//  Created by 张文超 on 2018/11/6.
//  Copyright © 2018年 张文超. All rights reserved.
//

import UIKit
import Moya

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
//        let view = ViewController()
        
        
//        view.selectBtn()
        
//        var dic = ["phoneNum": 110, "passWord": 120]
        
        let moyaApi = MoyaProvider<moyaApi>()
        //创建请求
        moyaApi.request(.login(phoneNum: 110, passWord: 120)) {result in
            switch result {
            case let .success(response):
                print("----",response)
                break
                
            case let .failure(error):
                print("+++++:",error)
                break
                
            }
            
        }
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

}
