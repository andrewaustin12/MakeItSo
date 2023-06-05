//
//  Reminder.swift
//  MakeItSo
//
//  Created by andrew austin on 6/5/23.
//

import Foundation

struct Reminder: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted = false
}

extension Reminder {
    static let samples = [
        Reminder(title: "Build sample App", isCompleted: true),
        Reminder(title: "Create tutorial"),
        Reminder(title: "???"),
        Reminder(title: "Profit!"),
    ]
}
