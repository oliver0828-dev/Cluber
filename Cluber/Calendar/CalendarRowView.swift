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
        data.items.sorted { $0.sort < $1.sort }.filter { stringToDateConverter(start: $0.start, end: $0.end, dateDate: date) }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if items.isEmpty {
                Text("No Event")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.secondary)
            } else {
                ForEach(items, id: \.id) { item in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(item.summary)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)

                        if let startDate = item.start, let endDate = item.end, !startDate.isEmpty, !endDate.isEmpty {
                            Text("\(startDate)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
            }
        }
        .padding()
    }

    // MARK: - Date Functions

    func getOnlyDateMonthYearFromFullDate(currentDateFormate: String, conVertFormate: String, convertDate: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = currentDateFormate
        if let finalDate = formatter.date(from: convertDate) {
            formatter.dateFormat = conVertFormate
            return formatter.string(from: finalDate)
        }
        return ""
    }

    func stringToDateConverter(start: String?, end: String?, dateDate: Date) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        guard let changedDateStr = start, let changedDate = dateFormatter.date(from: changedDateStr) else { return false }

        if let endStr = end, let changedEndDate = dateFormatter.date(from: endStr) {
            return (changedDate <= dateDate) && (changedEndDate >= dateDate)
        } else {
            return Calendar.current.isDate(changedDate, inSameDayAs: dateDate)
        }
    }

    func dateRange(dateString: String) -> String {
        // Implement as needed
        return "hello"
    }
}
