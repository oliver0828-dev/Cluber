

import SwiftUI
import iCalendarParser


struct TestView: View {
    let rawICS: String = "https://www.dis.sc.kr/calendar/calendar_354.ics"
    let parser = ICParser()
    
    var calendar: ICalendar? {
        parser.calendar(from: rawICS)
    }
    
    var body: some View {
        Text(calendar.debugDescription)
    }
}

#Preview {
    TestView()
}
