import SwiftUI

@available(iOS 18.0, *)
struct LunchRowView: View {
    var data: EventCalModel
    @AppStorage("selectedDate") var date: Date = Date()  // Persist the selected date
    @Environment(\.colorScheme) var colorScheme
    
    var items: [EventCalModel.Item] {
        data.items.sorted { $0.sort < $1.sort }.filter { stringToDateConverter(start: $0.start, end: $0.end, dateDate: date) }
    }
    
    var body: some View {
        VStack {
            if (items.isEmpty) {
                Text("Lunch is not being served")
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundStyle(.gray)
            }
            ForEach(items, id: \.id) { item in
                Text(item.summary)
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundStyle(.gray)
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
}

struct non18LunchRowView: View {
    var data: EventCalModel
    @Binding var date: Date
    @Environment(\.colorScheme) var colorScheme
    
    var items: [EventCalModel.Item] {
        data.items.sorted { $0.sort < $1.sort }.filter {stringToDateConverter(start: $0.start, end: $0.end, dateDate: date)}
    }
    
    var body: some View {
        VStack {
            if (items.isEmpty) {
                Text("Lunch is not being served")
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundStyle(.gray)
            }
            ForEach(items, id: \.id) { item in
                Text(item.summary)
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundStyle(.gray)
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
}
