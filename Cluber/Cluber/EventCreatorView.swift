//
//  EventCreatorViewe.swift
//  Cluber
//
//  Created by Oliver Park on 3/13/24.
//

import EventKit
import SwiftUI

class EventManager: ObservableObject {
    private var store = EKEventStore()

    func createEvent(title: String, startDate: Date, endDate: Date) {
        let event = EKEvent(eventStore: store)
        event.title = title
        event.startDate = startDate
        event.endDate = endDate
        event.calendar = store.defaultCalendarForNewEvents
        
        do {
            try store.save(event, span: .thisEvent, commit: true)
            print("Event saved")
        } catch {
            print("Error saving event: \(error.localizedDescription)")
        }
    }
}

struct EventCreatorView: View {
    @StateObject private var eventManager = EventManager()
    @State private var title: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    var body: some View {
        Form {
            TextField("Event Title", text: $title)
            DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
            DatePicker("End Date", selection: $endDate, displayedComponents: .date)
            Button("Create Event") {
                eventManager.createEvent(title: title, startDate: startDate, endDate: endDate)
            }
        }
    }
}

#Preview{
    EventCreatorView()
}


