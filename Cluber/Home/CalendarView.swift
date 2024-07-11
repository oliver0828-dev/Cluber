//
//  CalendarView.swift
//  Cluber
//
//  Created by Oliver Park on 6/1/24.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject var manager = GetCal()
    var body: some View {
        RowView(data: manager.event)
    }
}

#Preview {
    CalendarView()
        .environmentObject(GetCal())
}


