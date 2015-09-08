//
//  DeliveryCardCell.swift
//  design02
//
//  Created by IT-ELEVEN on 3/9/15.
//  Copyright (c) 2015 swiftcombat. All rights reserved.
//

import UIKit
import QuartzCore

class DeliveryCardCell: UITableViewCell {

    var cardFrame   = UIView()
    var colorBand   = UIView()
    
    var priceLabel  = UILabel()
    var dayLabel    = UILabel()
    var hourLabel   = UILabel()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clearColor()
        
        self.cardFrame = UIView(frame: CGRectMake(15, 6, CGRectGetWidth(self.frame)-30, 148))
        self.cardFrame.backgroundColor = UIColor.whiteColor()
        self.cardFrame.layer.cornerRadius = 6
        self.cardFrame.clipsToBounds = true
        
        self.cardFrame.layer.borderColor = UIColorFromRGB(0x3e4c5b).colorWithAlphaComponent(0.6).CGColor
        self.cardFrame.layer.borderWidth = 0.8
        
        self.colorBand = UIView(frame: CGRectMake(0, 0, 8, CGRectGetHeight(self.cardFrame.frame)))
        self.cardFrame.addSubview(self.colorBand)
        
        self.priceLabel = UILabel(frame: CGRectMake(0, 0, 90, 70))
        self.priceLabel.text = "$25"
        self.priceLabel.textColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.9)
        self.priceLabel.textAlignment = NSTextAlignment.Center
        self.priceLabel.font = UIFont(name: "HelveticaNeue-Light", size: 22)
        self.cardFrame.addSubview(self.priceLabel)
        
        self.dayLabel = UILabel(frame: CGRectMake(15, CGRectGetHeight(self.cardFrame.frame)-50, 90-15, 13))
        self.dayLabel.text = "Today".uppercaseString
        self.dayLabel.textColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.5)
        self.dayLabel.font = UIFont.systemFontOfSize(10)
        self.cardFrame.addSubview(self.dayLabel)
        
        self.hourLabel = UILabel(frame: CGRectMake(15, CGRectGetHeight(self.cardFrame.frame)-35, 90-15, 13))
        self.hourLabel.text = "06:30 PM"
        self.hourLabel.textColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.6)
        self.hourLabel.font = UIFont.systemFontOfSize(14)
        self.cardFrame.addSubview(self.hourLabel)
        
        self.addSubview(self.cardFrame)
    }
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func performWithColor(color: UIColor, comming: Bool) {
        self.colorBand.backgroundColor = color
        
        if comming == true {
            self.colorBand.frame = CGRectMake(0, 0, 90, CGRectGetHeight(self.cardFrame.frame))
            self.priceLabel.textColor = UIColor.whiteColor().colorWithAlphaComponent(0.9)
            self.dayLabel.textColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
            self.hourLabel.textColor = UIColor.whiteColor().colorWithAlphaComponent(0.6)
        }
        else{
            self.colorBand.frame = CGRectMake(0, 0, 8, CGRectGetHeight(self.cardFrame.frame))
            self.priceLabel.textColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.9)
            self.dayLabel.textColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.5)
            self.hourLabel.textColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.6)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
}
