//
//  LunchData.swift
//  Cluber
//
//  Created by Oliver Park on 5/5/24.
//

import Foundation
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

