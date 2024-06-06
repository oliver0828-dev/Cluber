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
    
    @State private var name: String = ""
    @AppStorage("userName") var savedName: String = ""
    
    let grade: [String] = ["Elementary", "Middle", "High"]
    
    var body: some View {
        GeometryReader { _ in
            if showingLaunchScreen && savedName.isEmpty {
                VStack {
                    Spacer()
                    Text("Welcome to Cluber!")
                        .foregroundStyle(.black)
                        .font(.title.bold())
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 350, height: 50)
                            .foregroundStyle(.gray.opacity(0.4))
                        TextField("Your Firstname Only", text: $name)
                            .frame(width: 300, height: 50)
                            .foregroundStyle(.black)
                            .padding()
                    }
                    
                    ColorView()
                    HStack {
                        Picker("Grade", selection: $usernameGrade.schoolGrade) {
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
                            savedName = name
                        }
                    } label: {
                        Label("Start", systemImage: "arrow.forward.circle.fill")
                            .font(.title)
                            .foregroundStyle(.black)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(CircleColor(gradeLevel: usernameGrade.schoolGrade))
                .transition(.move(edge: .bottom))
            } else {
               ContentView(username: $savedName)
            }
        }
        .preferredColorScheme(.light)
      
    }
}


#Preview {
    OnboardingView()
        .environmentObject(UsernameGradeClass())
        
}









