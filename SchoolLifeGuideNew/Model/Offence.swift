//
//  Offence.swift
//  SchoolLifeGuideNew
//
//  Created by Chen, Sihan on 2021-03-05.
//

import Foundation

class Offence: Identifiable, Codable, Hashable {
    static func == (lhs: Offence, rhs: Offence) -> Bool {
        return lhs.id == rhs.id
       
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(areaOfViolation)
        hasher.combine(timesOfViolation)
        hasher.combine(levelOfCompliance)
    }
    
    // Identify what properties should be read to and written from JSON
    enum TaskCodingKeys: CodingKey {
        case areaOfViolation
        case timesOfViolation
        case levelOfCompliance
    }
    
    var id = UUID()
    var areaOfViolation: String
    var timesOfViolation: TimesOfViolation
    var levelOfCompliance: Double
    
    
    internal init(id: UUID = UUID(), areaOfViolation: String, timesOfViolation: TimesOfViolation, levelOfCompliance: Double) {
        self.id = id
        self.areaOfViolation = areaOfViolation
        self.timesOfViolation = timesOfViolation
        self.levelOfCompliance = levelOfCompliance
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TaskCodingKeys.self)
        
        // Decode "description" property into an instance of the String type
        self.areaOfViolation = try container.decode(String.self, forKey: .areaOfViolation)
        // Decode "TimesOfViolation" property into an instance of the TimesOfViolation type
        self.timesOfViolation = try container.decode(TimesOfViolation.self, forKey: .timesOfViolation)
        // Decode "levelOfCompliance" property into an instance of the Double type
        self.levelOfCompliance = try container.decode(Double.self, forKey: .levelOfCompliance)
    }
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: TaskCodingKeys.self)

        // Everything is encoded into String types
        try container.encode(areaOfViolation, forKey: .areaOfViolation)
        try container.encode(timesOfViolation.rawValue, forKey: .timesOfViolation)
        try container.encode(levelOfCompliance, forKey: .levelOfCompliance)
        
    }
    
}

let testOffence = [
    Offence(areaOfViolation: "testtest", timesOfViolation: TimesOfViolation.First, levelOfCompliance: 90),
    Offence(areaOfViolation: "testtest", timesOfViolation: TimesOfViolation.First, levelOfCompliance: 90),
    Offence(areaOfViolation: "testtest", timesOfViolation: TimesOfViolation.First, levelOfCompliance: 90)

]
