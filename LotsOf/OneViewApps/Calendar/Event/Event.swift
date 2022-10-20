//
//  Event.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 20/10/22.
//

import Foundation

var eventsList = [Event]()

final class Event {
    var id: Int!
    var name: String!
    var date: Date!
    
    func eventsForDate(date: Date) -> [Event] {
        var daysEvents = [Event]()
        eventsList.forEach { event in
            if (event.date == date) {
                daysEvents.append(event)
            }
        }
        return daysEvents
    }
}
