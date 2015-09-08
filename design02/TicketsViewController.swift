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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColorFromRGB(0x587b85)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.clearColor()
        
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
        
        var comming = false
        if indexPath.row == 1 {
            comming = true
        }
        
        cell.performWithColor(self.colors[indexPath.row], comming: comming)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
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
    
}
