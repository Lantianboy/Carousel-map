//
//  MyScrollView.swift
//  test
//
//  Created by 张文超 on 2018/11/9.
//  Copyright © 2018年 张文超. All rights reserved.
//

import UIKit

class MyScrollView: UIView,UIScrollViewDelegate{
    
    let scrollView = UIScrollView()
    var imagesCount:Int!
    let pages = UIPageControl()
    let width = UIScreen.main.bounds.width
    
    
    func creatMyScrollView(imageMut:[String],imageHeight:CGFloat){
        
        scrollView.frame = CGRect(x: 0, y: 0, width: width, height: imageHeight)
        scrollView.delegate = self
        self .addSubview(scrollView)
        
        //for 循环创建相应数量的图片
        for i in 0...(imageMut.count - 1){
            
            let imageView1 = UIImageView(frame: CGRect(x: (CGFloat(i) * width), y: 0, width: width, height: imageHeight))
            
            //设置轮播图图片
            imageView1.image = UIImage(named: imageMut[i])
            
            imageView1.isUserInteractionEnabled = true

            scrollView.addSubview(imageView1)
            
            let gusture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
            
            imageView1 .addGestureRecognizer(gusture)
            
        }
        
        imagesCount = imageMut.count
        
        //设置轮播图容量 比实际图片的数量多一
        scrollView.contentSize = CGSize(width: CGFloat(imageMut.count) * width, height: imageHeight)
        //关闭弹性
        scrollView.bounces = false
        //分页设置
        scrollView.isPagingEnabled = true
        //单独创建n+1张轮播图 和第一张图片相同 当图片显示最后一张时把偏移量归零形成无限轮播
        let imageView2 = UIImageView(frame: CGRect(x: CGFloat(imageMut.count) * width, y: 0, width: width, height: imageHeight))
        imageView2.image = UIImage(named: imageMut[0])
        scrollView.addSubview(imageView2)
        
        
        pages.frame = CGRect(x: 0, y: imageHeight - 30, width: width, height: 40)
        pages.numberOfPages = imageMut.count
//        pages.backgroundColor = UIColor .green
        pages.currentPage = 0
        pages.currentPageIndicatorTintColor = UIColor .red
        pages.pageIndicatorTintColor = UIColor .white
        
        
        if imageMut.count > 1{
            creatTimer()
            self .addSubview(pages)
        }
        
    }
    
    func creatTimer(){
        //创建定时器
        let timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(repeast), userInfo: nil, repeats: true)
        //开启定时器
        timer.fire()
        
    }
    
    //实现定时器方法
    @objc func repeast(){
        //设置轮播图偏移量
        scrollView.setContentOffset(CGPoint(x: scrollView.contentOffset.x + width,y: 0), animated: true)
        //如果图片为最后一张就回到第一张
        if scrollView.contentOffset == CGPoint(x: CGFloat(width) * CGFloat(imagesCount), y: 0)  {
            //            scr.setContentOffset(CGPoint(0,0), animated:false )
            scrollView.contentOffset = CGPoint(x: 0, y: 0)//偏移度归零
        }
        
    }
    
    //当手动滚动视图翻页时调用该方法
    var cnt = 0
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let cPage = scrollView.contentOffset.x / width
        pages.currentPage = Int(cPage)
        cnt = Int(cPage)
    }
    
    //自动播放时，调用该方法
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        cnt += 1
        pages.currentPage = cnt % imagesCount
    }
    
    
    @objc func singleTap(sing:UITapGestureRecognizer){
        
        
    }
    
    
}
