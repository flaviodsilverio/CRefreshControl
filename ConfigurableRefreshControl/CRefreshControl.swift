//
//  CRefreshControl.swift
//  ConfigurableRefreshControl
//
//  Created by Flávio Silvério on 3/10/16.
//  Copyright © 2016 Flavio Silverio. All rights reserved.
//

import UIKit

class CRefreshControl: UIRefreshControl {

    var baseColor : UIColor?
    var textColor : UIColor?
    private var baseText : String?

    var successColor : UIColor?
    var successTextColor : UIColor?

    var failureColor : UIColor?
    var failureTextColor : UIColor?
    
    var text : String?


    override init() {
        
        super.init()
        
        initialization()

    }

    func setText(text text: String, withColor:UIColor){
        
        attributedTitle = NSMutableAttributedString(string: text, attributes: [NSForegroundColorAttributeName : withColor])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        initialization()
    }
    
    func initialization(){
    
        baseColor = super.backgroundColor
        successColor = super.backgroundColor
        failureColor = super.backgroundColor
        
        textColor = UIColor.blackColor()
        successTextColor = UIColor.blackColor()
        failureTextColor = UIColor.blackColor()
        
        text = ""
        
    }
    
    override func beginRefreshing() {
        
        baseText = text
        backgroundColor = baseColor
        setText(text: baseText!, withColor: textColor!)
        
        super.beginRefreshing()
    }
    
    func endSucessfulRefresh(){
        
        backgroundColor = successColor
        setText(text: text!, withColor: successTextColor!)

        super.endRefreshing()
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC)),dispatch_get_main_queue() , {
            self.backgroundColor = self.baseColor
            self.setText(text: self.baseText!, withColor: self.textColor!)
        })
    }
    
    func endFailedRefresh(){
        
        backgroundColor = failureColor
        setText(text: text!, withColor: failureTextColor!)

        super.endRefreshing()
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC)),dispatch_get_main_queue() , {
            
            self.backgroundColor = self.baseColor
            self.setText(text: self.baseText!, withColor: self.textColor!)

        })
    }

}
