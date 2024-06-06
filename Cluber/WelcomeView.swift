//
//  WelcomeView.swift
//  Cluber
//
//  Created by Oliver Park on 5/7/24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var selection = 0
    
    let tabName = ["Home", "Lunch Club", "ASA", "Lunch"]
    let tabImage = ["house.fill", "person.3.fill", "figure.run", "fork.knife"]
    let tabExplain = ["You will access the school events and calendar in the home.", "You will view the Lunch Club offering in school week days.", "You will view the After School Activies in weekdays.", "You will see lunch menus with images."]
    
    var body: some View {
        
        TabView(selection: $selection) {
            ForEach(0..<4, id: \.self) { i in
                AnotherView(tabName: tabName[i], tabImage: tabImage[i], description: tabExplain[i])
            }
        } 
        .tabViewStyle(.page)
    }
}

struct AnotherView: View {
    var tabName: String
    var tabImage: String
    var description: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 300)
                .foregroundStyle(.blue.opacity(0.5))
                .shadow(radius: 20)
            VStack {
                HStack {
                    Text(tabName)
                        .font(.title.bold())
                    Image(systemName: tabImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                Text(description)
                    .frame(width: 250, height: 70)
                    .padding(0.4)
                HStack{
                    
                    Text("Swipe")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 150, height: 50)
                   
                }
                .background(.blue)
                .clipShape(.rect(cornerRadius: 30))
            }
        }
    }
}

#Preview {
    WelcomeView()
}

#Preview {
    AnotherView(tabName: "Home", tabImage: "house.fill", description: "You will access the school events and calendar in the home.")
}

