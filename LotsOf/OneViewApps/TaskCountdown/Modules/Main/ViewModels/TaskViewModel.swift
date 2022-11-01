//
//  TaskViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 31/10/22.
//

import Foundation

final class TaskViewModel {
    // MARK: Variables
    private var task: Task!
    private let taskTypes: [TaskType] = [
        TaskType(symbolName: "star", typeName: "Priority"),
        TaskType(symbolName: "iphone", typeName: "Develop"),
        TaskType(symbolName: "gamecontroller", typeName: "Gaming"),
        TaskType(symbolName: "wand.and.stars.inverse", typeName: "Editing")
    ]
    
    private var selectedIndex = -1 {
        didSet {
            self.task.taskType = getTaskTypes()[selectedIndex]
        }
    }
    
    private var hours = Box(0)
    private var minutes = Box(0)
    private var seconds = Box(0)
    
    // MARK: init
    
    init() {
        task = Task(taskName: "", taskDescription: "", seconds: 0, taskType: .init(symbolName: "", typeName: ""), timeStamp: 0)
    }
    
    //MARK: functions
    
    func setSelectedIndex(to value: Int) {
       selectedIndex = value
    }
    
    func setTaskName(to value: String) {
        task.taskName = value
    }
    
    func setTaskDescription(to value: String) {
        task.taskDescription = value
    }
    func getSelectedIndex() -> Int {
        selectedIndex
    }
    
    func getTask() -> Task {
        return task
    }
    
    func getTaskTypes() -> [TaskType] {
        return taskTypes
    }
    
    func setHours(to value: Int) {
        hours.value = value
    }
    
    func setMinutes(to value: Int) {
        var newMinutes = value
        if (value >= 60) {
            newMinutes -= 60
            hours.value += 1
        }
        minutes.value = newMinutes
    }
    
    func setSeconds(to value: Int) {
        var newSeconds = value
        if (value >= 60) {
            newSeconds -= 60
            minutes.value += 1
        }
        
        if (minutes.value >= 60) {
            minutes.value -= 60
            hours.value += 1
        }
        seconds.value = newSeconds
    }
    
    func getHours() -> Box<Int> {
        hours
    }
    func getMinutes() -> Box<Int> {
        minutes
    }
    func getSeconds() -> Box<Int> {
        seconds
    }
    
    func computeSeconds() {
        task.seconds = (hours.value * 3600) + (minutes.value * 60) + seconds.value
        task.timeStamp = Date().timeIntervalSince1970
    }
    
    func isTaskValid() -> Bool {
        if (!task.taskName.isEmpty && !task.taskDescription.isEmpty && selectedIndex != -1 && (seconds.value > 0 || minutes.value > 0 || hours.value > 0)) {
            return true
        }
        return false
    }
    
}
