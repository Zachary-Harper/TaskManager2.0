//
//  AddTaskViewController.swift
//  TaskManager2.0
//
//  Created by Zachary Harper on 12/6/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit

class AddTaskViewController : UIViewController {
    let library = Library.sharedInstance
    
    @IBOutlet weak var taskTitleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var prioritySegementedController: UISegmentedControl!
    
    @IBAction func saveTapped(_ sender: Any) {
        trySavingTask()
        performSegue(withIdentifier: "unwindToLibraryScreen", sender: self)
    }
    
    var newTask: Task?
    
    
    let segments:  [(title: String, priority: Task.Priority)] =
        [
            ("Low", .low),
            ("Medium", .medium),
            ("High", .high),
            ("Extreme", .extreme),]
    
    override func viewDidLoad() {
        prioritySegementedController.removeAllSegments()
        
        for (index, segment) in  segments.enumerated() {
            prioritySegementedController.insertSegment(withTitle: segment.title, at: index, animated: false)
        }
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
  
    
    
    func trySavingTask() {
        guard let title = taskTitleTextField.text else {
            return
        }
        
        guard let description = descriptionTextView.text else {
            return
        }
        
       let priority = segments[prioritySegementedController.selectedSegmentIndex].priority
        
        newTask = Task(title: title, description: description, priority: priority)
        library.tasks.append(newTask!)
    }
    
    
}


