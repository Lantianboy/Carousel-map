//
//  ViewController.swift
//  Carousel-map
//
//  Created by 张文超 on 2018/11/12.
//  Copyright © 2018年 张文超. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var array = [String]()
    let tableView = UITableView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton()
        //        btn.backgroundColor = UIColor .red
        btn .setTitleColor(UIColor .black, for: UIControl.State.normal)
        btn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        //        self.view .addSubview(btn)
        btn .setTitle("编辑", for: UIControl.State.normal)
        btn .addTarget(self, action: #selector(btnClick), for: UIControl.Event.touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (customView: btn)
        
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        self.view .addSubview(tableView)
        tableView.register(NSClassFromString("TableViewCell"), forCellReuseIdentifier: "goodsCell")//自定义tableViewCell注册
        //        arrayMut = NSMutableArray.init()//数组初始化
        //        array = ["测试1","测试2","测试3","测试4"]
        for i in 1..<6{//for循环
            array.append("摄影机"+String(i))
        }
        for p in array {
            if p == "摄影机2" {
                print("for循环")
            }
        }
        //        let array1 = ["加入1","加入2","加入3"]
        
        //        array.append(contentsOf: array1)加入一个数组
        //        arrayMut?.add("可变数组")
        //        array.append("ceshi") 加入一个字符串
        print(array)
        
        self .selectBtn()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TableViewCell(style:UITableViewCell.CellStyle.default , reuseIdentifier: "goodsCell")//加载自定义cell
        cell.textLabel?.text = array[indexPath.row]
        cell.modelShowTag(indext:String(indexPath.row + 1))//自定义cell方法
        
        return cell ;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: false)
        let cell = tableView.cellForRow(at: indexPath) as! UITableViewCell
//        print(cell)
        didselect(cell: cell, str: "str")
    }
    
    func didselect(cell:UITableViewCell, str:NSString){
        
        print(cell)
    }
    
    @objc func btnClick(sender:UIButton?) {
        if sender?.tag == 23 {
            print("测试")
        }else{
            print("编辑")
        }
    }
    
    func selectBtn(){
        print("我是类方法")
    }


}

