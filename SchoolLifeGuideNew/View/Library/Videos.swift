//
//  Videos.swift
//  SchoolLifeGuideNew
//
//  Created by Chen, Sihan on 2021-02-18.
//

import Foundation

struct Videos {
    var list: [Video] = []
    
    init() {
        list.append(Video(name: "APCreateTaskVideo", extensions: ".mov"))
    }
}
