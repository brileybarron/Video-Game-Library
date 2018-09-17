//
//  ESRBRating.swift
//  VideoGameLibrary
//
//  Created by Briley Barron on 9/13/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation

enum ESRBRating{
    case EC     //Early Childhood
    case E      //Everyone
    case E10Up  //Everyone 10 and older
    case T      //Teens or older than 13
    case M      //Mature and any one over 17
    case AO     //Adults only
    case RP     //rating pending
    case NR     //Not Rated this will only occur if a value is not given
}
