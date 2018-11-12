//
//  TableViewCell.swift
//  test
//
//  Created by 张文超 on 2018/11/7.
//  Copyright © 2018年 张文超. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
//        self.contentView .addSubview(btn)
        
        // Initialization code
    }
    
    lazy var btn:UIButton = {
        let bt = UIButton()
        bt.backgroundColor = UIColor .red
        bt.frame = CGRect(x:self.frame.size.width, y: 20, width: 40, height: 30)
//        bt .setTitle("点击", for: UIControl.State.normal)
        bt .addTarget(self, action: #selector(btnClick), for: UIControl.Event.touchUpInside)
//        bt.tag = 23
        return bt
        
    }()
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        
        self.addSubview(btn)
        
    }
    
    func modelShowTag(indext:String){
        btn .setTitle(indext, for: UIControl.State.normal)
        let btnTag = indext as NSString
        btn.tag = btnTag.integerValue
        
        
    }
    
//    class func allocTableViewCell()->UITableViewCell{
//
//        let cell = UITableViewCell()
//
//
////        cell .addSubview(btn)
//        return cell
//    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @objc func btnClick(sender:UIButton?) {
  
        print(sender?.tag)
    }

}
