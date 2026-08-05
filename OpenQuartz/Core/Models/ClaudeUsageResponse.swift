//
//  ClaudeUsageResponse.swift
//  OpenQuartz
//
//  Created by Abhiram Krishna M on 05/08/26.
//

import Foundation

struct ClaudeUsageResponse: Decodable {
    let fiveHour: UsageWindow?
    let sevenDay: UsageWindow?
    
    enum CodingKeys: String, CodingKey {
        case fiveHour = "five_hour"
        case sevenDay = "seven_day"
    }
}

struct UsageWindow: Decodable{
    let utilization: Double
    let resetsAt: String
    
    enum CodingKeys: String, CodingKey {
        case utilization
        case resetsAt = "resets_at"
    }
}


