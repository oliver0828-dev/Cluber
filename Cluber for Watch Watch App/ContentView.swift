//
//  ContentView.swift
//  Cluber for Watch Watch App
//
//  Created by Oliver Park on 8/25/24.
//

import SwiftUI

struct ContentView: View {
    @State var TodayDate = Date.now
    @State var tomorrow = Date.now.addingTimeInterval(86400)
    @State var currentPage = 0  // 0 for Today, 1 for Tomorrow
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $currentPage) {
                    LunchMenuView(date: $TodayDate, currentPage: $currentPage)
                        .tag(0)
                    LunchMenuView(date: $tomorrow, currentPage: $currentPage)
                        .tag(1)
//                    ScheduleView()
//                        .tag(2)
                }
                .tabViewStyle(.verticalPage)
            }
            .padding()
            .navigationTitle("Luncher")
        }
    }
}

#Preview {
    ContentView()
}
