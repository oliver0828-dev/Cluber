//
//  LunchModel.swift
//  Cluber
//
//  Created by Oliver Park on 7/10/24.
//

import Foundation
import SwiftUI
import Combine

class GetLunch: ObservableObject {
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
        let calendarID = "itc1p2pd25jg8l2akarlkrc334gjcofe@import.calendar.google.com"
        
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
