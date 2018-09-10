//
//  Game.swift
//  VideoGameLibrary
//
//  Created by Briley Barron on 9/10/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation

class Game {
    var checkedIn: Bool = true
    let title: String
    var dueDate: Date? = nil
    
    init (title: String){
        self.checkedIn = checkedIn
        self.title = title
        self.dueDate = dueDate
    }
}
