//
//  OneViewAppsViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 18/10/22.
//

import Foundation
import UIKit

final class OneViewAppsViewModel {
    
    var appList: [appInfo] = [
            appInfo(name: "WeeklyCalendar", detail: "CalendarView. which display a list of events of selectedDate",viewController: "WeeklyCalendarViewController")]

}

struct appInfo {
    var name: String
    var detail: String
    var viewController: String
}
