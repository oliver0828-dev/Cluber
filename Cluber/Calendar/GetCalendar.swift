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
        let testDate = Date()
        let myDateFormatter = DateFormatter()
        //        myDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        //        myDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        //        let startMO = testDate.startOfMonth()
        //        let endMO = testDate.endOfMonth()
        //        let calendarID = "en.usa#holiday@group.v.calendar.google.com"
        //
        //        var componets = URLComponents()
        //        componets.scheme = "https"
        //        componets.host = "www.googleapis.com"
        //        componets.path = "/calendar/v3/calendars/\(calendarID)/events"
        //        componets.queryItems = [
        //            URLQueryItem(name: "key", value: apiKey),
        //            URLQueryItem(name: "timeMin", value: myDateFormatter.string(from: startMO)),
        //            URLQueryItem(name: "timeMax", value: myDateFormatter.string(from: endMO)),
        //            URLQueryItem(name: "showDelted", value: "false"),
        //            URLQueryItem(name: "singleEvents", value: "true")
        //        ]
        //
        let timeMaxString = "2024-12-31T00:00:00Z"
        let timeMinString = "2024-01-01T00:00:00Z"
        let apiKey = "AIzaSyBFDvZH4c6WOwNkXA-pAUC_RuaTeA13g00"
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
