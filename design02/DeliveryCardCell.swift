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
    
    var lineVerticalSeparator       = UIImageView()
    var lineHorizontalSeparator     = UIImageView()
    
    var sourceLabel         = UILabel()
    var destinationLabel    = UILabel()
    
    var requestTitleLabel   = UILabel()
    var requestValueLabel   = UILabel()
    
    var pledgeTitleLabel    = UILabel()
    var pledgeValueLabel    = UILabel()
    
    var weightTitleLabel    = UILabel()
    var weightValueLabel    = UILabel()
    
    var dotedView           = UIView()
    
    var didTouch: (()->())?
    
    var flipView1 = UIView()
    var flipView2 = UIView()
    var flipView3 = UIView()
    
    
    // MARK: initialization
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clearColor()
        
        self.cardFrame = UIView(frame: CGRectMake(10, 6, CGRectGetWidth(self.frame)-20, 148))
        self.cardFrame.backgroundColor = UIColor.whiteColor()
        self.cardFrame.layer.cornerRadius = 6
        self.cardFrame.clipsToBounds = true
        
        self.cardFrame.layer.borderColor = UIColorFromRGB(0x3e4c5b).colorWithAlphaComponent(0.6).CGColor
        self.cardFrame.layer.borderWidth = 0.8
        
        let touchGesture = UITapGestureRecognizer(target: self, action: Selector("touchAction:"))
        self.cardFrame.addGestureRecognizer(touchGesture)
        
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
        
        self.lineVerticalSeparator = UIImageView(frame: CGRectMake(90, 10, 1, CGRectGetHeight(self.cardFrame.frame)-20))
        self.lineVerticalSeparator.image = ImageWithColor(UIColorFromRGB(0xe7e7e7))
        self.cardFrame.addSubview(self.lineVerticalSeparator)
        
        self.sourceLabel = UILabel(frame: CGRectMake(CGRectGetMaxX(self.lineVerticalSeparator.frame)+20, 16, CGRectGetWidth(self.cardFrame.frame) - (CGRectGetMaxX(self.lineVerticalSeparator.frame)+20) - 10, 25))
        self.sourceLabel.text = "W 79th St, New York, 10024"
        self.sourceLabel.font = UIFont.systemFontOfSize(13)
        self.sourceLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        self.cardFrame.addSubview(self.sourceLabel)
        
        self.lineHorizontalSeparator = UIImageView(frame: CGRectMake(CGRectGetMaxX(self.lineVerticalSeparator.frame)+20, 42, CGRectGetWidth(self.cardFrame.frame) - (CGRectGetMaxX(self.lineVerticalSeparator.frame)+20) - 10, 1))
        self.lineHorizontalSeparator.image = ImageWithColor(UIColorFromRGB(0xe7e7e7))
        self.cardFrame.addSubview(self.lineHorizontalSeparator)
        
        self.destinationLabel = UILabel(frame: CGRectMake(CGRectGetMaxX(self.lineVerticalSeparator.frame)+20, 45, CGRectGetWidth(self.cardFrame.frame) - (CGRectGetMaxX(self.lineVerticalSeparator.frame)+20) - 10, 25))
        self.destinationLabel.text = "W 139th St, New York, 10030"
        self.destinationLabel.font = UIFont.systemFontOfSize(13)
        self.destinationLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        self.cardFrame.addSubview(self.destinationLabel)
        
        var bottomButtonsX      = CGRectGetMaxX(self.lineVerticalSeparator.frame)+10
        var bottomButtonsWidth  = (CGRectGetWidth(self.cardFrame.frame) - (CGRectGetMaxX(self.lineVerticalSeparator.frame)+10) - 10)/3
        
        self.requestTitleLabel = UILabel(frame: CGRectMake(bottomButtonsX, 100, bottomButtonsWidth, 14))
        self.requestTitleLabel.font = UIFont.systemFontOfSize(11)
        self.requestTitleLabel.text = "Request".uppercaseString
        self.requestTitleLabel.textColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.8)
        self.cardFrame.addSubview(self.requestTitleLabel)
        
        self.requestValueLabel = UILabel(frame: CGRectMake(bottomButtonsX, 115, bottomButtonsWidth, 20))
        self.requestValueLabel.font = UIFont.systemFontOfSize(16)
        self.requestValueLabel.text = "2"
        self.requestValueLabel.textColor = UIColor.darkGrayColor()
        self.cardFrame.addSubview(self.requestValueLabel)
        
        
        self.pledgeTitleLabel = UILabel(frame: CGRectMake(bottomButtonsX+bottomButtonsWidth, 100, bottomButtonsWidth, 14))
        self.pledgeTitleLabel.font = UIFont.systemFontOfSize(11)
        self.pledgeTitleLabel.text = "Pledge".uppercaseString
        self.pledgeTitleLabel.textColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.8)
        self.cardFrame.addSubview(self.pledgeTitleLabel)
        
        self.pledgeValueLabel = UILabel(frame: CGRectMake(bottomButtonsX+bottomButtonsWidth, 115, bottomButtonsWidth, 20))
        self.pledgeValueLabel.font = UIFont.systemFontOfSize(16)
        self.pledgeValueLabel.text = "$80"
        self.pledgeValueLabel.textColor = UIColor.darkGrayColor()
        self.cardFrame.addSubview(self.pledgeValueLabel)
        
        
        self.weightTitleLabel = UILabel(frame: CGRectMake(bottomButtonsX+bottomButtonsWidth*2, 100, bottomButtonsWidth, 14))
        self.weightTitleLabel.font = UIFont.systemFontOfSize(11)
        self.weightTitleLabel.text = "Weight".uppercaseString
        self.weightTitleLabel.textColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.8)
        self.cardFrame.addSubview(self.weightTitleLabel)
        
        self.weightValueLabel = UILabel(frame: CGRectMake(bottomButtonsX+bottomButtonsWidth*2, 115, bottomButtonsWidth, 20))
        self.weightValueLabel.font = UIFont.systemFontOfSize(16)
        self.weightValueLabel.text = "light"
        self.weightValueLabel.textColor = UIColor.darkGrayColor()
        self.cardFrame.addSubview(self.weightValueLabel)
        
        // dotted line
        self.dotedView = UIView(frame: CGRectMake(bottomButtonsX-4, CGRectGetMinY(self.sourceLabel.frame), 10, CGRectGetMaxY(self.destinationLabel.frame)-CGRectGetMinY(self.sourceLabel.frame)))
        self.cardFrame.addSubview(self.dotedView)
        
        self.addSubview(self.cardFrame)
    }
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func performWithColor(color: UIColor, comming: Bool) {
        self.colorBand.backgroundColor = color
        
        if comming == true {
            self.colorBand.frame        = CGRectMake(0, 0, 90, CGRectGetHeight(self.cardFrame.frame))
            self.priceLabel.textColor   = UIColor.whiteColor().colorWithAlphaComponent(0.9)
            self.dayLabel.textColor     = UIColor.whiteColor().colorWithAlphaComponent(0.5)
            self.hourLabel.textColor    = UIColor.whiteColor().colorWithAlphaComponent(0.6)
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                self.cardFrame.frame = CGRectMake(10, 20, CGRectGetWidth(self.frame)-20, 148)
                
            }, completion: { (finish) -> Void in
                if finish == true {
                    
                    // Flip 1
                    self.flipView1 = UIView(frame: CGRectMake(10, CGRectGetMaxY(self.cardFrame.frame)-60, CGRectGetWidth(self.cardFrame.frame), 60))
                    self.flipView1.backgroundColor = UIColor.whiteColor()
                    self.addSubview(self.flipView1)
                    
                    var layerTranform: CALayer = self.flipView1.layer
                    
                    var rotationAndPerspectiveTransform: CATransform3D = CATransform3DIdentity
                    rotationAndPerspectiveTransform.m34 = 1.0 / -500
                    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, CGFloat(180 * M_PI / 180.0), CGFloat(1.0), CGFloat(0.0), CGFloat(0.0))
                    layerTranform.transform = rotationAndPerspectiveTransform
                    
                    var translationTransform: CATransform3D = CATransform3DIdentity
                    
                        
                        self.flipView1.center = CGPointMake(CGRectGetMidX(self.flipView1.frame) + CGRectGetHeight(self.flipView1.frame)/2, CGRectGetMidY(self.flipView1.frame))
                    
                   
    
                        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, CGFloat(90 * M_PI / 180.0), CGFloat(1.0), CGFloat(0.0), CGFloat(0.0))
                        self.flipView1.layer.transform = rotationAndPerspectiveTransform
                        
                        var labeltest = UILabel(frame: CGRectMake(0, 0, 280, 60))
                        labeltest.text = "Lorem impsum over due"
                        self.flipView1.addSubview(labeltest)
                        
                 
                    
                }
            })
        }
        else{
            self.colorBand.frame        = CGRectMake(0, 0, 8, CGRectGetHeight(self.cardFrame.frame))
            self.priceLabel.textColor   = UIColor.darkGrayColor().colorWithAlphaComponent(0.9)
            self.dayLabel.textColor     = UIColor.darkGrayColor().colorWithAlphaComponent(0.5)
            self.hourLabel.textColor    = UIColor.darkGrayColor().colorWithAlphaComponent(0.6)
        }
        
        self.drawDots(color)
    }
    
    func drawDots(color: UIColor) {
        let radius: CGFloat = 3.0
        
        var circleLayer1 = CAShapeLayer()
        circleLayer1.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0 * radius, height: 2.0 * radius)  , cornerRadius: radius).CGPath
        circleLayer1.position = CGPoint(x: (CGRectGetWidth(self.dotedView.frame)/2)-radius, y: 9)
        circleLayer1.fillColor = UIColor.clearColor().CGColor
        circleLayer1.strokeColor = color.CGColor
        self.dotedView.layer.addSublayer(circleLayer1)
        
        var dot1 = CAShapeLayer()
        dot1.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0, height: 2.0)  , cornerRadius: 1).CGPath
        dot1.position = CGPoint(x: (CGRectGetWidth(self.dotedView.frame)/2)-1, y: 19)
        dot1.fillColor = UIColor.clearColor().CGColor
        dot1.strokeColor = color.colorWithAlphaComponent(0.7).CGColor
        self.dotedView.layer.addSublayer(dot1)
        
        var dot2 = CAShapeLayer()
        dot2.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0, height: 2.0)  , cornerRadius: 1).CGPath
        dot2.position = CGPoint(x: (CGRectGetWidth(self.dotedView.frame)/2)-1, y: 25)
        dot2.fillColor = UIColor.clearColor().CGColor
        dot2.strokeColor = color.colorWithAlphaComponent(0.7).CGColor
        self.dotedView.layer.addSublayer(dot2)
        
        var dot3 = CAShapeLayer()
        dot3.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0, height: 2.0)  , cornerRadius: 1).CGPath
        dot3.position = CGPoint(x: (CGRectGetWidth(self.dotedView.frame)/2)-1, y: 31)
        dot3.fillColor = UIColor.clearColor().CGColor
        dot3.strokeColor = color.colorWithAlphaComponent(0.7).CGColor
        self.dotedView.layer.addSublayer(dot3)
        
        var circleLayer2 = CAShapeLayer()
        circleLayer2.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0 * radius, height: 2.0 * radius), cornerRadius: radius).CGPath
        circleLayer2.position = CGPoint(x: (CGRectGetWidth(self.dotedView.frame)/2)-radius, y: 38)
        circleLayer2.fillColor = UIColor.clearColor().CGColor
        circleLayer2.strokeColor = color.CGColor
        self.dotedView.layer.addSublayer(circleLayer2)
    }
    
  
    // MARK: - Touch Event Action
    func touchAction(recognizer: UITapGestureRecognizer) {
        self.didTouch?()
    }
    
    
    // MARK: - TableViewCell Delegate
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
