//
//  Tasks.swift
//  TaskManager2.0
//
//  Created by Zachary Harper on 12/6/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import Foundation
class Task {
    
    
    
    
    enum Availability {
        case complete
        case incomplete(dueDate: Date)
    }
    let title: String
    let description : String
    var available : Availability
    var priority : Priority
    
    enum Priority: String {
        case extreme = "Extreme"
        case high = "High"
        case medium = "Medium"
        case low = "Low"
        
    }
    
    init(title: String, description: String, priority: Priority) {
        self.title = title
        self.available = .complete
        self.description = description
        self.priority = priority
        
    }
    
    
}

