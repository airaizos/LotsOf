//
//  OneViewAppsViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 18/10/22.
//

import Foundation
import UIKit

final class OneViewAppsViewModel {
    
    var appList: [AppInfo] = [
            AppInfo(name: "Calendar", detail: "CalendarView. which display a list of events of selectedDate",viewController: "MonthlyCalendarViewController"),
            AppInfo(name: "Task Countdown", detail: "Reloj temporizador de tareas", viewController: "NewTaskViewController")]

}

struct AppInfo: Decodable {
    var name: String
    var detail: String
    var image: String?
    var backgroundColor: String?
    var viewController: String

}
