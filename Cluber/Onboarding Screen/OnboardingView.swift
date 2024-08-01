//
//  OnboardingView.swift
//  Cluber
//
//  Created by Oliver Park on 5/6/24.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @Environment(\.colorScheme) var colorScheme
    @State private var showingLaunchScreen = true
    @State private var name: String = ""
    @State private var isPresented = false
    
    @AppStorage ("gradeInt") var gradeInt: Int = 1
    @AppStorage("userName") var savedName: String = ""
    @AppStorage("gradeLevel") var gradeLevel: String = "Elementary"
    
    
    let grade: [String] = ["Elementary", "Middle", "High"]
    
    var body: some View {
        GeometryReader { _ in
            if showingLaunchScreen && savedName.isEmpty && !isPresented {
                VStack {
                    Spacer()
                    Text("Welcome to Cluber!")
                        .foregroundStyle(.black)
                        .font(.title.bold())
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 350, height: 50)
                            .foregroundStyle(.gray.opacity(0.4))
                        HStack {
                            TextField("Your Firstname Only", text: $name)
                                .fontDesign(.rounded)
                                .frame(width: 300, height: 50)
                                .foregroundStyle(.black)
                                .submitLabel(.done)
                                .padding()
                            
                        }
                    }
                    HStack {
                        Text("Grade:")
                            .foregroundStyle(.black)
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 120, height: 50)
                                .foregroundStyle(.gray.opacity(0.4))
                            TextField("", value: $gradeInt, formatter: NumberFormatter())
                                .fontDesign(.rounded)
                                .frame(width: 20, height: 50)
                                .foregroundStyle(.black)
                                .submitLabel(.done)
                        }
                    }
                    HStack {
                        Picker("Grade", selection: $gradeLevel) {
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
                            usernameGrade.userName = savedName
                            usernameGrade.schoolGrade = gradeLevel
                            usernameGrade.gradeNumber = gradeInt
                        }
                        
                        if gradeInt > 12 {
                            isPresented.toggle()
                        }
                    } label: {
                        Label("Start", systemImage: "arrow.forward.circle.fill")
                            .font(.title)
                            .foregroundStyle(.black)
                    }
                    .alert(isPresented: $isPresented) {
                        Alert (title: Text("Please check your inputs"))
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .transition(.move(edge: .bottom))
            } else {
                ContentView(username: $savedName, gradeLevel: $gradeLevel)
            }
        }
        .background(CircleColor(gradeLevel: gradeLevel, colorScheme: colorScheme))
        
        
    }
    
    func gradeLevelSuggestion(number: Int) -> String {
        if (1...5).contains(number) {
            return "Elementary"
        } else if (6...8).contains(number) {
            return "Middle"
        } else if (9...12).contains(number) {
            return "High"
        } else {
            return "Unknown"
        }
    }
}


#Preview {
    OnboardingView()
        .environmentObject(UsernameGradeClass())
    
}









