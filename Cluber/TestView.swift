//
//  TestView.swift
//  Cluber
//
//  Created by Oliver Park on 6/1/24.
//

import SwiftUI
import Foundation

func fetchICalData(from url: URL, completion: @escaping (String?) -> Void) {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            completion(nil)
            return
        }
        let icalString = String(data: data, encoding: .utf8)
        completion(icalString)
    }
    task.resume()
}

struct Event {
    let summary: String
    let startDate: Date
}

func parseICalData(_ icalString: String) -> [Event] {
    var events: [Event] = []
    let lines = icalString.split(separator: "\n")
    var currentSummary: String?
    var currentStartDate: Date?
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss'Z'"
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    
    for line in lines {
        if line.hasPrefix("SUMMARY:") {
            currentSummary = String(line.dropFirst("SUMMARY:".count))
        } else if line.hasPrefix("DTSTART:") {
            let dateString = String(line.dropFirst("DTSTART:".count))
            currentStartDate = dateFormatter.date(from: dateString)
        } else if line == "END:VEVENT" {
            if let summary = currentSummary, let startDate = currentStartDate {
                let event = Event(summary: summary, startDate: startDate)
                events.append(event)
            }
            currentSummary = nil
            currentStartDate = nil
        }
    }
    return events
}


struct EventListView: View {
    @State private var events: [Event] = []
    
    var body: some View {
        List(events, id: \.startDate) { event in
            VStack(alignment: .leading) {
                Text(event.summary)
                    .font(.headline)
                Text(event.startDate, style: .date)
                    .font(.subheadline)
            }
        }
        .onAppear {
            loadICalEvents()
        }
    }
    
    func loadICalEvents() {
        if let url = URL(string: "https://www.dis.sc.kr/calendar/calendar_354.ics") {
            fetchICalData(from: url) { icalString in
                if let icalString = icalString {
                    DispatchQueue.main.async {
                        self.events = parseICalData(icalString)
                    }
                }
            }
        }
    }
}

#Preview {
    EventListView()
}


