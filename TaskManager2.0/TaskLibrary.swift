//
//  TaskLibrary.swift
//  TaskManager2.0
//
//  Created by Zachary Harper on 12/6/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import Foundation
class Library {
    static let sharedInstance = Library()
    
    var tasks = [Task]()
}
