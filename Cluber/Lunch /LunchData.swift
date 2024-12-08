//
//  LunchData.swift
//  Cluber
//
//  Created by Oliver Park on 5/5/24.
//

import Foundation
import Combine
import SwiftUI
import UserNotifications


struct LunchMenuView: View {
    @Binding var date: Date
    @ObservedObject var manager = GetLunch()
    
    
    var isTomorrow: Bool {
        let calendar = Calendar.current
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date.now)!
        return calendar.isDate(date, inSameDayAs: tomorrow)
    }
    
    var body: some View {
        VStack{
            HStack {
                Text(isTomorrow ? "Tomorrow's Lunch" : "Today's Lunch")
                Image(systemName: "fork.knife")
            }.font(.title2)
            
            
            Divider()
                .frame(width: 350)
            
            if #available(iOS 18.0, *) {
                LunchRowView(data: manager.event, date: date)
                    .frame(width: 350)
            } else {
                non18LunchRowView(data: manager.event, date: $date)
                    .frame(width: 350)
            }
        }
        .fontDesign(.rounded)
    }
    
}

#Preview {
    LunchMenuView(date: .constant(Date.now))
        .environmentObject(GetLunch())
}


