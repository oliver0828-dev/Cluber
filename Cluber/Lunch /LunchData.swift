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
                    
                    .font(.title2)
                Text(date, format: .dateTime.month().day())
                    .font(.title2.bold())
                    .foregroundStyle(.black)
                    .frame(width: 120, height: 40)
                    .clipShape(.rect(cornerRadius: 10))
                 
            }
            Divider()
                .frame(width: 350)
            
            LunchRowView(data: manager.event, date: $date)
        }
        .fontDesign(.rounded)
    }
    
}

#Preview {
    LunchMenuView(date: .constant(Date.now))
        .environmentObject(GetLunch())
}


