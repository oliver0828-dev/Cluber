//
//  ContentView.swift
//  Cluber
//
//  Created by Oliver Park on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            LunchClubView()
                .tabItem {
                    Label ("Lunch Club", systemImage: "person.3.fill")
                }
            ASAView()
                .tabItem {
                    Label("ASA", systemImage: "figure.run")
                }
            LunchView()
                .tabItem {
                    Label("Lunch", systemImage: "fork.knife")
                }
        }
    }
}

#Preview {
    ContentView()
}
