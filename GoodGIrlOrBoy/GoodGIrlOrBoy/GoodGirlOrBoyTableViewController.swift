//
//  GoodGirlOrBoyTableViewController.swift
//  GoodGIrlOrBoy
//
//  Created by Margaret Ikeda on 1/21/17.
//  Copyright © 2017 Margaret Ikeda. All rights reserved.
//

import UIKit
import CoreData

class GoodGirlOrBoyTableViewController: UITableViewController {
    
    var controller: NSFetchedResultsController<BehavioralEvent>!
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem (barButtonSystemItem: .add, target: self, action: #selector (addButtonPressed))
        
        let request: NSFetchRequest<BehavioralEvent> = BehavioralEvent.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(BehavioralEvent.timestamp), ascending: false)]
        controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        try! controller.performFetch() //anything goes wrong, will explode
    }
    func addButtonPressed() {
        _ = BehavioralEvent(context: context)
        try! context.save()
        
        try! controller.performFetch()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        //        if let sections = controller.sections {
        //            let info = sections[sections]
        //            return info.numberOfObjects
        //        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let info = sections[section]
            return info.numberOfObjects
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)
        let object = controller.object(at: indexPath)
        cell.textLabel?.text = object.childsName
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if editingStyle == .delete {
                let object = controller.object(at: indexPath)
                context.delete(object)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
        }
    }
        /*
         // Override to support rearranging the table view.
         override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
}
