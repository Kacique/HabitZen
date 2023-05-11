//
//  HabitItem.swift
//  HabitZen
//
//  Created by William on 5/10/23.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    let habitName: String
    var habitComplete: Bool
}
