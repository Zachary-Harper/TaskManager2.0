//
//  LibraryCell.swift
//  TaskManager2.0
//
//  Created by Zachary Harper on 12/6/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit

class LibraryCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    @IBOutlet weak var availibilityView: UIView!
    
    
    
    func setup(task: Task) {
        
        titleLabel.text = task.title
        priorityLabel.text = task.priority.rawValue
        descriptionLabel.text = task.description
        
        switch task.available {
            
        case .complete:
            dateLabel.isHidden = true
            
            availibilityView.backgroundColor = .green
            
        case .incomplete(let date):
            dateLabel.isHidden = false
            availibilityView.backgroundColor = .red
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            dateLabel.text = dateFormatter.string(from: date)
            
        }
        
    }
    
    
}
