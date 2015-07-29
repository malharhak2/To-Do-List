//
//  FirstViewController.swift
//  To Do List
//
//  Created by Anthony Pigeot on 27/07/2015.
//  Copyright (c) 2015 Anthony Pigeot. All rights reserved.
//

import UIKit

var todoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet weak var todoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("todoList") != nil {
            todoList = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = todoList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todoList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: "todoList")
            todoListTable.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
    
        todoListTable.reloadData()
    }


}

