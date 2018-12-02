//
//  Record.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/28/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import UIKit

class Record {
    var rank: Int = 0
    var name: String = ""
    var picPath: String = ""
    var persona: String = ""
    
    init(rank: Int, name: String, picPath: String, persona: String) {
        self.rank = rank
        self.name = name
        self.picPath = picPath
        self.persona = persona
    }
}
