import Foundation

struct EventCalModel {
    var items: [Item]
    
    struct Item: Codable  {
        let id: String
        let status: String
        let summary: String
        let start: String?
        let dateTime: String
        let timeZone: String
        let end: String?
        let sort: String
    }
    
    init() {
        self.items = [Item]()
    }
    
    init(model: EventCal) {
        self.init()
        
        for index in 0..<model.items.count {
            let id = model.items[index].id
            let status = model.items[index].status
            let summary = model.items[index].summary ?? ""
            let start = model.items[index].start?.date ?? ""
            let dateTime = model.items[index].start?.dateTime ?? ""
            let timeZone = model.items[index].start?.timeZone ?? ""
            let end = model.items[index].end?.date ?? ""
            let sort = model.items[index].start?.date ?? model.items[index].start?.dateTime ?? ""
            
            if model.items[index].status != "cancelled" {
                var sorted = ""
                if !start.isEmpty {
                    sorted = getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd'T'HH:mm:ssZ", conVertFormate: "dd", convertDate: sort)
                } else if !dateTime.isEmpty {
                    sorted = getOnlyDateMonthYearFromFullDate(currentDateFormate: "yyyy-MM-dd", conVertFormate: "dd", convertDate: sort)
                }
                self.items.append(Item(id: id, status: status, summary: summary, start: start, dateTime: dateTime, timeZone: timeZone, end: end, sort: sorted))
            }
        }
    }
}

func getOnlyDateMonthYearFromFullDate(currentDateFormate: String, conVertFormate: String, convertDate: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = currentDateFormate
    guard let finalDate = formatter.date(from: convertDate) else { return "" }
    formatter.dateFormat = conVertFormate
    return formatter.string(from: finalDate)
}
