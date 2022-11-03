//
//  TestTaskCountdown.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 31/10/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class TestTaskCountdown: XCTestCase {

    func testGetTaskTypes()  throws {
        let task = TaskViewModel()
        let taskTypes = task.getTaskTypes()
        let taskType = TaskType(symbolName: "star", typeName: "Priority")
        XCTAssertTrue((taskTypes.first(where: { $0 == taskType }) != nil))
    }
    
    func testGetSelectedIndex() throws {
        
        let task = TaskViewModel()
        let getSelectedIndex = task.getSelectedIndex()
        
        XCTAssertEqual(-1, getSelectedIndex)
    }

    func testGetTask() throws {
        let task = TaskViewModel()
        let emptyTask = Task(taskName: "", taskDescription: "", seconds: 0, taskType: .init(symbolName: "", typeName: ""), timeStamp: 0)
        
        let getTask = task.getTask()
        
        XCTAssertEqual(emptyTask, getTask)
    }
   
    func testValidateSeconds() throws {
        let task = TaskViewModel()
        task.setSeconds(to: 59)
        let getSeconds = task.getSeconds().value
        
        XCTAssertEqual(59,getSeconds)
    }
    
    func testValidateMinutes() throws {
        let task = TaskViewModel()
        task.setMinutes(to: 59)
        let getMinutes = task.getMinutes().value
        
        XCTAssertEqual(59, getMinutes)
        
    }
    
    func testValidateHours() throws {
        let task = TaskViewModel()
        task.setHours(to: 19)
        let getHours = task.getHours().value
        XCTAssertEqual(19, getHours)
    }
    
    func testValidateHHMMSS() throws {
        let task = TaskViewModel()
        task.setHours(to: 4)
        task.setMinutes(to: 64)
        task.setSeconds(to: 65)
        task.computeSeconds()
        
        let seconds = task.getSeconds().value
        let minutes = task.getMinutes().value
        let hours = task.getHours().value
        XCTAssertEqual(5, seconds)
        XCTAssertEqual(5, minutes)
        XCTAssertEqual(5, hours)
    }
    
    func testNotValidTask() throws {
        let taskZeroSeconds = TaskViewModel()
        taskZeroSeconds.setSeconds(to: 0)
        
        XCTAssertFalse(taskZeroSeconds.isTaskValid())
        
        let taskEmptyName = TaskViewModel()
        taskEmptyName.setTaskName(to: "")
        
        XCTAssertFalse(taskEmptyName.isTaskValid())
      
        let taskEmptyDescription = TaskViewModel()
        taskEmptyDescription.setTaskDescription(to: "")
        XCTAssertFalse(taskEmptyDescription.isTaskValid())
        
    }
   
    func testValidTask() throws {
        let task = TaskViewModel()
        task.setTaskName(to: "Task")
        task.setTaskDescription(to: "Description")
        task.setSelectedIndex(to: 2)
        task.setHours(to: 1)

        XCTAssertTrue(task.isTaskValid())
    }
    
}
