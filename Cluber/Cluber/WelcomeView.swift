//
//  WelcomeView.swift
//  Cluber
//
//  Created by Oliver Park on 5/7/24.
//

import SwiftUI

struct WelcomeView: View {
    @State var name: String
    var body: some View {
        VStack {
            Text("Welcome, " + name + "!")
                .font(.largeTitle.bold())
            
                
        }
    }
}

#Preview {
    WelcomeView(name: "Oliver")
}
