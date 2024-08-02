//
//  GetCalendar.swift
//  Cluber
//
//  Created by Oliver Park on 7/9/24.
//

import SwiftUI
import Combine
import Foundation

class GetCal: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var event = EventCalModel() {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    init() {
        getData()
    }
    
    func getData() {
        _ = Date()
        _ = DateFormatter()

        let timeMaxString = "2024-12-31T00:00:00Z"
        let timeMinString = "2024-01-01T00:00:00Z"
        let apiKey = "YOUR API KEY"
        let calendarID = "dis.sc.kr_537jpt5irot15jvj48krp1f5b4@group.calendar.google.com"
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://www.googleapis.com/calendar/v3/calendars/\(calendarID)/events?orderBy=startTime&singleEvents=true&timeMax=\(timeMaxString)&timeMin=\(timeMinString)&key=\(apiKey)")!)) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                if httpResponse.statusCode == 200 {
                    if let data = data {
                        DispatchQueue.main.async {
                            do {
                                let test = try JSONDecoder().decode(EventCal.self, from: data)
                                self.event = EventCalModel(model: test)
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
            }
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
        }.resume()
    }
}
