//
//  LunchData.swift
//  Cluber
//
//  Created by Oliver Park on 5/5/24.
//

import Foundation
import Combine
import SwiftUI


struct LunchMenuView: View {
    @Binding var date: Date
    @Binding var currentPage: Int
    @ObservedObject var manager = GetLunch()
    
    var isTomorrow: Bool {
        let calendar = Calendar.current
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date.now)!
        return calendar.isDate(date, inSameDayAs: tomorrow)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text(currentPage == 0 ? "Today's Lunch" : "Tomorrow's Lunch")
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                
                LunchRowView(data: manager.event, date: $date)
                    .fontWeight(.medium)
                
            }
            .fontDesign(.rounded)
        }
    }
    
}

#Preview {
    LunchMenuView(date: .constant(Date.now.addingTimeInterval(86400)), currentPage: .constant(0))
        .environmentObject(GetLunch())
}


