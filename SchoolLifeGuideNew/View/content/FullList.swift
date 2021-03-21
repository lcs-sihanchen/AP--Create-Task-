//
//  FullList.swift
//  SchoolLifeGuideNew
//
//  Created by Chen, Sihan on 2021-02-15.
//

import Foundation


func fullList() -> [LifeGuide] {
    
    let lifeGuide = LifeGuides()
    let fullList = lifeGuide.list
    var newList: [LifeGuide] = []
    
    // Put all subtopics in one array in order to allow filtering
    for singleLifeGuide in fullList {
        for singleSubTopic in singleLifeGuide.subTopics {
            newList.append(singleSubTopic)
        }
    }
    
    return newList
}




