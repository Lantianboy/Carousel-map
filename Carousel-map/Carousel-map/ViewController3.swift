//
//  ViewController3.swift
//  test
//
//  Created by 张文超 on 2018/11/6.
//  Copyright © 2018年 张文超. All rights reserved.
//

import UIKit

class ViewController3: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{


    var arayMut = NSMutableArray()
    let width = UIScreen.main.bounds.size.width//获取屏幕宽
    let height = UIScreen.main.bounds.size.height//获取屏幕高
    var array = [String]()
    var collection:UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }

    func initView(){

        self.view.backgroundColor = UIColor.white
        array = ["淘宝","京东","拼多多","微信商城","天猫","唯品会"]
        let layout = UICollectionViewFlowLayout()

        collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: width, height: 60), collectionViewLayout: layout)
        //注册z一个cell
        collection .register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor .groupTableViewBackground
        //设置总是可以滑动
        collection.alwaysBounceHorizontal = true
        //不显示横向滚动条
        collection.showsHorizontalScrollIndicator = false
        //设置滑动方向 横向滑动
        layout.scrollDirection = .horizontal
        //设置item的大小
        layout.itemSize = CGSize(width: 80, height: 30)
        //设置边距
        layout.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        self.view .addSubview(collection)
        
        collection .addSubview(label)
        
        arayMut.add(0)

    }
    
    lazy var label:(UILabel) = {
        let la = UILabel(frame: CGRect(x: 33, y: 45, width: 30, height: 2))
        la.backgroundColor = UIColor .red
        
        return la
    }()
    
    
    override func loadView(){
        super.loadView()
        //设置y从导航栏下开始
        self.edgesForExtendedLayout = .bottom
    }
    
    override func viewWillAppear(_ animated: Bool) {
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }

    //collectionView delegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        for view in cell.subviews{
            view .removeFromSuperview()
        }
//        cell.backgroundColor = UIColor.red
        let label = UILabel()
        label.frame = CGRect(x: (cell.frame.size.width - 60) / 2, y: (cell.frame.size.height - 20) / 2, width: 60, height: 20)
//        label.center = cell.center
        label.font = UIFont .systemFont(ofSize: 14)
        label.text = array[indexPath.item]
        label.textAlignment = NSTextAlignment.center
//        label.backgroundColor = UIColor .purple
        cell.addSubview(label)
        if arayMut .contains(indexPath.item){
            label.textColor = UIColor.red
        }
        

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        arayMut .removeAllObjects()
        arayMut.add(indexPath.item)
        collectionView .reloadData()
        
        if indexPath.item != array.count - 1{
            
            collectionView.scrollToItem(at: IndexPath.init(row: indexPath.item + 1, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        }else{
            collectionView.scrollToItem(at: IndexPath.init(row: indexPath.item, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        }
        

        //获取点击的cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell


        labelOffeSze(cell: cell, labelStr: array[indexPath.item])
    }
    
    //设置标示条的位置和宽度
    func labelOffeSze(cell:UICollectionViewCell , labelStr:String){
    
        print(cell)
        
        label.frame.size.width = getLabelWidth(str: labelStr, font: UIFont .systemFont(ofSize: 14), height: 20)
        
        UIView.animate(withDuration: 0.5) {
            self.label.frame.origin.x = cell.frame.origin.x + (cell.frame.width - self.label.frame.size.width)/2
        }
        
    }
    
    
    /// 动态计算Label宽度
    func getLabelWidth(str: String, font: UIFont, height: CGFloat)-> CGFloat {
        
        let statusLabelText: NSString = str as NSString
        
        let size = CGSize(width: CGFloat(MAXFLOAT), height: height)
        
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil).size
        
        return strSize.width
        
    }
    
    
    
    /// 动态计算Label高度
    func getLabelHegit(str: String, font: UIFont, width: CGFloat)-> CGFloat {
        let statusLabelText: NSString = str as NSString
        
        let size = CGSize(width: width, height: CGFloat(MAXFLOAT))
        
        let dic = NSDictionary(object: font, forKey: NSAttributedString.Key.font as NSCopying)
        
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key : AnyObject], context: nil).size
        
        return strSize.height
        
    }

    
    
    
    
    
}
