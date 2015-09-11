//
//  TicketsViewController.swift
//  design02
//
//  Created by IT-ELEVEN on 3/9/15.
//  Copyright (c) 2015 swiftcombat. All rights reserved.
//

import UIKit


class TicketsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var colors = [UIColorFromRGB(0xf7a60b), UIColorFromRGB(0x5a4a9c), UIColorFromRGB(0x52a43a), UIColorFromRGB(0xf7a60b), UIColorFromRGB(0xb71313), UIColorFromRGB(0xf7a60b), UIColorFromRGB(0x5a4a9c), UIColorFromRGB(0x52a43a), UIColorFromRGB(0xf7a60b), UIColorFromRGB(0xb71313), UIColorFromRGB(0xf7a60b), UIColorFromRGB(0x5a4a9c)]
    
    var selectedIndex: Int = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColorFromRGB(0x587b85)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.clearColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // space in top
        self.tableView.tableHeaderView = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 34))
        
        // space in bootom
        self.tableView.tableFooterView = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 34))
    }


    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = DeliveryCardCell()
        
        if self.selectedIndex == indexPath.row {
            cell.performWithColor(self.colors[indexPath.row], comming: true)
        }
        else{
            cell.performWithColor(self.colors[indexPath.row], comming: false)
        }
        
        cell.didTouch = {
            
            var oldSelectedIndex = (self.selectedIndex >= 0) ? self.selectedIndex : -1
            var newSelectedIndex = indexPath.row
            
            self.resizeCellSelectedIndex(newSelectedIndex, oldSelectedIndex: oldSelectedIndex)
            
        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == self.selectedIndex {
            return 460
        }
        return 160
    }

    
    // MARK: -
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
   
    
    // MARK: -
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func resizeCellSelectedIndex(newSelectedIndex: Int, oldSelectedIndex: Int) {
        
        if oldSelectedIndex >= 0 {
            
            self.selectedIndex = -1
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.closeOldSelected(oldSelectedIndex)
            }, completion: { (finished) -> Void in
                if finished == true {
                    
                    self.selectedIndex = newSelectedIndex
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.openNewSelected(newSelectedIndex)
                    }, completion: nil)
                }
            })
        }
        else {
            self.selectedIndex = newSelectedIndex
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.openNewSelected(newSelectedIndex)
            }, completion: nil)
        }
    }
    
    func closeOldSelected(index: Int) {
        self.tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: 0)], withRowAnimation: UITableViewRowAnimation.None)
    }
    
    func openNewSelected(index: Int) {
        self.tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: 0)], withRowAnimation: UITableViewRowAnimation.None)
        
        self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: false)
    }
}
