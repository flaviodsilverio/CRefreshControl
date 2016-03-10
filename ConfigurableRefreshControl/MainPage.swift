//
//  ViewController.swift
//  ConfigurableRefreshControl
//
//  Created by Flávio Silvério on 3/10/16.
//  Copyright © 2016 Flavio Silverio. All rights reserved.
//

import UIKit

class MainPage: UITableViewController {

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureRefreshControl()
        
        refreshControl?.addTarget(self, action: "testRefreshing", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureRefreshControl(){
    
        let refresh = (refreshControl as! CRefreshControl)
    
        refresh.baseColor = UIColor.grayColor()
        refresh.successColor = UIColor.greenColor()
        refresh.failureColor = UIColor.redColor()
        
    }
    
    //MARK - Table methods
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = "Some Cell"
        return cell;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    //MARK - Refresh testing
    
    func testRefreshing(){
        
        let refresh = (refreshControl as! CRefreshControl)
        refresh.text = "Refreshing"
        refresh.beginRefreshing()
        
        let success = Int(arc4random_uniform(2))
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC * UInt64(3))),dispatch_get_main_queue() , {
            
            if success == 1 {
                
                refresh.text = "Success!"
                refresh.endSucessfulRefresh()
                
            } else {
                
                refresh.text = "Error!"
                refresh.endFailedRefresh()
                
            }
        })
        
    }


}

