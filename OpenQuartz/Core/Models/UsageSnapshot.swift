//
//  UsageSnapshot.swift
//  OpenQuartz
//
//  Created by Abhiram Krishna M on 31/07/26.
//

import Foundation

// usage report
struct UsageSnapshot {
    let limits: [LimitWindow]
}

// one single limit
struct LimitWindow {
    let name: String
    let percentUsed: Double
    let resetsAt: Date?
}


