//
//  colorScheme.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/14/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

import Foundation
import ChameleonFramework

let primary = FlatWatermelon()
let secondary = FlatWatermelonDark()
let tertiary = FlatWhite()

func setButtonState(button btn: UIButton, status stat: Bool) {
    if stat {
        btn.backgroundColor = secondary
        btn.tintColor = tertiary
    } else {
        btn.backgroundColor = FlatWhiteDark()
        btn.tintColor = tertiary
    }
}
