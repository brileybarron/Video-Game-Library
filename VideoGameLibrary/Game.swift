//
//  Game.swift
//  VideoGameLibrary
//
//  Created by Briley Barron on 9/10/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation

class Game {//this will be the object every game created is

    var checkedIn: Bool = true
    let title: String
    var dueDate: Date? = nil
    let ESRB : ESRBRating
    init (title: String, ESRB: ESRBRating){
        self.title = title
        self.ESRB = ESRB
    }
}
