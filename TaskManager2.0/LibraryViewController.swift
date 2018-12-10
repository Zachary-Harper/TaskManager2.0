//
//  ViewController.swift
//  TaskManager2.0
//
//  Created by Zachary Harper on 12/6/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController{


    @IBOutlet weak var tableView: UITableView!
    
    
    let library = Library.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        library.tasks.append(Task(title: "DO Homework", description: "You have math and english", priority: .high))
        library.tasks.append(Task(title: "Take out Garbage", description: "Take garbage out to curb", priority: .medium))
        
        tableView.reloadData()
        print(library.tasks)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func unwindToLibraryScreen(segue: UIStoryboardSegue){
        
    }


}

extension LibraryViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! LibraryCell
        let task = library.tasks[indexPath.row]
        
        cell.setup(task: task)
        
        cell.titleLabel?.text = library.tasks[indexPath.row].title
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.sharedInstance.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return [deleteAction]
    }
    
    func checkOut(at indexPath: IndexPath) {
        let task = self.library.tasks[indexPath.row]
        
        let calendar = Calendar(identifier: .gregorian)
        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
        
        task.available = .incomplete(dueDate: dueDate)
        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup(task: task)
    }
    
    func checkIn(at indexPath: IndexPath) {
        let task = self.library.tasks[indexPath.row]
        task.available = .complete
        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup(task: task)
    }
    
    
    
}


