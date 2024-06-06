//
//  MainView.swift
//  Cluber
//
//  Created by Oliver Park on 3/13/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Label("Calendar",systemImage: "calendar")
                }
            EventCreatorView()
                .tabItem {
                    Label("Favorite", systemImage: "star.fill")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle")
                }
                .environmentObject(AccountList())
        }
    }
}
#Preview {
    MainView()
}
