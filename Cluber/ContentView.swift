//
//  ContentView.swift
//  Cluber
//
//  Created by Oliver Park on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @Binding var username: String
    @Binding var gradeLevel: String
    @State private var selection  = 0
    
    var body: some View {
        
        TabView(selection: $selection) {
            HomeView(username: username)
                .tabItem {
                    VStack {
                        if selection == 0 {
                            Image("tab1Blue")
                                .resizable()
                                .frame(width: 1, height: 1)
                                .scaledToFit()
                        } else {
                            Image("tab1")
                                .resizable()
                                .frame(width: 1, height: 1)
                                .scaledToFit()
                        }
                        Text("Home")
                    }
                }.tag(0)
            
            LunchClubView()
                .tabItem {
                    VStack {
                        if selection == 1 {
                            Image("tab2Blue")
                                .resizable()
                                .frame(width: 1, height: 1)
                                .scaledToFit()
                        } else {
                            Image("tab2")
                                .resizable()
                                .frame(width: 1, height: 1)
                                .scaledToFit()
                        }
                        Text("Lunch Club")
                    }
                }.tag(1)
            
            ASAView()
                .tabItem {
                    VStack{
                        if selection == 2 {
                            Image("tab3Blue")
                                .resizable()
                                .frame(width: 1, height: 1)
                                .scaledToFit()
                        } else {
                            Image("tab3")
                                .resizable()
                                .frame(width: 1, height: 1)
                                .scaledToFit()
                        }
                        Text("ASA")
                    }
                }.tag(2)
            
            LunchView()
                .tabItem {
                    VStack{
                        if selection == 3 {
                            Image("tab4Blue")
                                .resizable()
                                .frame(width: 1, height: 1)
                                .scaledToFit()
                        } else {
                            Image("tab4")
                                .resizable()
                                .frame(width: 1, height: 1)
                                .scaledToFit()
                        }
                        Text("Lunch")
                    }
                }.tag(3)
            
            SettingsView(username: username, gradeLevel: gradeLevel)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }.tag(4)
        }
    }
}

#Preview {
    ContentView(username: .constant("Oliver"), gradeLevel: .constant("High"))
        .environmentObject(UsernameGradeClass())
        .environmentObject(PhotoPickerViewModel())
}

struct logoHStack: View {
    @State var sfSymbol = false
    var imageName: String
    var body: some View {
        if sfSymbol {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .foregroundStyle(.gray)
        } else {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
        }
        
    }
}

