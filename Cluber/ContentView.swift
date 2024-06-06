//
//  ContentView.swift
//  Cluber
//
//  Created by Oliver Park on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var username: String
    var body: some View {
        TabView {
            HomeView(username: username)
                .tabItem {
                    VStack {
                        Image("tab1")
                            .resizable()
                            .frame(width: 1, height: 1)
                            .scaledToFit()
                        Text("Home")

                    }
                }
            LunchClubView()
                .tabItem {
                    VStack {
                        Image("tab2")
                            .resizable()
                            .frame(width: 1, height: 1)
                            .scaledToFit()
                        Text("Lunch Club")
                    }
                }
            ASAView()
                .tabItem {
                    VStack{
                        Image("tab3")
                            .resizable()
                            .frame(width: 1, height: 1)
                            .scaledToFit()
                        Text("ASA")
                    }
                }
            LunchView()
                .tabItem {
                    VStack{
                        Image("tab4")
                            .resizable()
                            .frame(width: 1, height: 1)
                            .scaledToFit()
                        Text("Lunch")
                    }
                }
            SettingsView(username: username)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .preferredColorScheme(.light)
    }
}



