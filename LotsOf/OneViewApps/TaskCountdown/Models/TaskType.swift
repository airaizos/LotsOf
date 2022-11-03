//
//  TaskType.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 31/10/22.
//

import Foundation

struct TaskType: Equatable {
    let symbolName: String
    let typeName: String
}

struct Task:Equatable {
    var taskName: String
    var taskDescription: String
    var seconds: Int
    var taskType: TaskType
    var timeStamp: Double
}

enum CountdownState {
    case suspended
    case running
    case pause
}
