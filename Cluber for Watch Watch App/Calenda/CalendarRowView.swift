//
//  CalendarRowView.swift
//  Cluber
//
//  Created by Oliver Park on 7/9/24.
//

import SwiftUI

struct RowView: View {
    var data: EventCalModel
    @Binding var date: Date
    @Environment(\.colorScheme) var colorScheme
    
    var items: [EventCalModel.Item] {
        data.items.sorted { $0.sort < $1.sort }.filter {stringToDateConverter(start: $0.start, end: $0.end, dateDate: date)}
    }
    
    var body: some View {
        VStack(alignment: .center) {
            if (items.isEmpty) {
                Text("No Event")
                    .foregroundStyle(colorScheme == .light ? .white : .black)
            }
            ForEach(items, id: \.id) { item in
                VStack(alignment: .leading) {
                    Text(item.summary)
                        .foregroundStyle(colorScheme == .light ? .white : .black)
                }
            }
        }
        .padding()
       
    }
    
    func getOnlyDateMonthYearFromFullDate(currentDateFormate: String, conVertFormate: String, convertDate: String ) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = currentDateFormate
        let finalDate = formatter.date(from: convertDate)
        formatter.dateFormat = conVertFormate
        let dateString = formatter.string(from: finalDate!)
        return dateString
    }
    
    func stringToDateConverter(start: String, end: String?, dateDate: Date) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let changedDate = dateFormatter.date(from: start)
        
        if let end {
            let changedEndDate = dateFormatter.date(from: end)
            return (changedDate?.compare(dateDate) == .orderedAscending) && (changedEndDate?.compare(dateDate) == .orderedDescending)
        } else {
            if changedDate?.compare(dateDate) == .orderedSame {
                return true
            } else {
                return false
            }
        }
    }
    
    func dateRange(dateString: String) -> String {
        
        return "hello"
    }
}

