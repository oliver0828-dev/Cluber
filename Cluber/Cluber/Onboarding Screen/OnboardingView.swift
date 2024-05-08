//
//  OnboardingView.swift
//  Cluber
//
//  Created by Oliver Park on 5/6/24.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    
    @State private var gradeLevel = "Elementary"
    @State private var showingLaunchScreen = true
    
    
    let grade: [String] = ["Elementary", "Middle", "High"]
    
    var body: some View {
        GeometryReader { _ in
            if showingLaunchScreen {
                VStack {
                    Spacer()
                    Text("Welcome to Cluber")
                        .foregroundStyle(.black)
                        .font(.title.bold())
//                    TextField(" Name", text: $usernameGrade.username)
//                        .foregroundStyle(.black)
//                        .frame(width: 300, height: 50)
//                        .background(.black.opacity(0.2))
//                        .clipShape(.rect(cornerRadius: 10))
//                        .padding()
                    
                    ColorView()
                    HStack {
                        Picker("Grade", selection: $usernameGrade.grade) {
                            ForEach(grade, id: \.self) { school in
                                Text(school)
                            }
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    Spacer()
                    Button{
                        withAnimation {
                            showingLaunchScreen = false
                        }
                    } label: {
                        Label("Start", systemImage: "arrow.forward.circle.fill")
                            .font(.title)
                            .foregroundStyle(.black)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(CircleColor(gradeLevel: usernameGrade.grade))
                .transition(.move(edge: .bottom))
            } else {
                ContentView()
            }
        }
      
    }
}


#Preview {
    OnboardingView()
        .environmentObject(UsernameGradeClass())
        .preferredColorScheme(.light)
}









