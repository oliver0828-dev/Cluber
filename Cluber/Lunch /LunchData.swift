//
//  LunchData.swift
//  Cluber
//
//  Created by Oliver Park on 5/5/24.
//

import Foundation
import Combine
import SwiftUI

struct LunchData: Hashable, Identifiable {
    var id = UUID()
    let TodayDate: Date
    let TommorowDate: Date
    let FoodList: String
}


struct LunchMenuView: View {
    @Binding var date: Date
    
    var isTomorrow: Bool {
        let calendar = Calendar.current
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date.now)!
        return calendar.isDate(date, inSameDayAs: tomorrow)
    }
    
    var body: some View {

        VStack{
            HStack {
                Text(isTomorrow ? "Tomorrow's Lunch" : "Today's Lunch")
                    
                    .font(.title2)
                Text(date, format: .dateTime.month().day())
                    .font(.title2.bold())
                    .foregroundStyle(.black)
                    .frame(width: 120, height: 40)
                    .background(isTomorrow ? .green : .yellow)
                    .clipShape(.rect(cornerRadius: 10))
                 
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 200)
            Divider()
                .frame(width: 350)
            
            Text("""
Rice
Seaweed Tofu Soybean Paste Soup
a mushroom soup
curry rice and tortiana
Sirloin pork cutlet and demisource
Pushily Tomato Pasta
Seasoned cucumbers
Kimchi
""")
            .font(.headline)
            .foregroundStyle(.gray)
        }
        .fontDesign(.rounded)
    }
    
}

#Preview {
    LunchMenuView(date: .constant(Date.now))
}


class GetLunch: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var event = EventCalModel() {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    init() {
        getlunchData()
    }
    
    func getlunchData() {
        _ = Date()
        _ = DateFormatter()
        let timeMaxString = "2024-08-31T00:00:00Z"
        let timeMinString = "2024-08-01T00:00:00Z"
        let apiKey = "AIzaSyBFDvZH4c6WOwNkXA-pAUC_RuaTeA13g00"
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
