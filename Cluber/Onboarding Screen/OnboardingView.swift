//
//  OnboardingView.swift
//  Cluber
//
//  Created by Oliver Park on 5/6/24.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @EnvironmentObject var profilePhotos: PhotoPickerViewModel
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
            if showingLaunchScreen && savedName.isEmpty {
                VStack {
                    Spacer()
                    Text("Welcome to Cluber!")
                        .foregroundStyle(colorSchemeDarkmode(colorScheme: colorScheme))
                        .font(.title.bold())
                       
                    Image("glider")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
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
                            .foregroundStyle(colorSchemeDarkmode(colorScheme: colorScheme))
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 120, height: 50)
                                .foregroundStyle(.gray.opacity(0.4))
                            TextField("", value: $gradeInt, formatter: NumberFormatter())
                                .fontDesign(.rounded)
                                .frame(width: 20, height: 50)
                                .foregroundStyle(colorSchemeDarkmode(colorScheme: colorScheme))
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
                .fontDesign(.rounded)
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
        .preferredColorScheme(.light)
        .environmentObject(UsernameGradeClass())
        .environmentObject(PhotoPickerViewModel())
    
}

func CircleColor(gradeLevel: String, colorScheme: ColorScheme) -> Color {
    if gradeLevel == "Elementary" && colorScheme == .light{
        return Color("yellowDark")
    } else if gradeLevel == "Elementary" && colorScheme == .dark {
        return .yellow.opacity(0.7)
    } else if gradeLevel == "Middle" && colorScheme == .light {
        return .blue.opacity(0.5)
    } else if gradeLevel == "High" && colorScheme == .light {
        return .green.opacity(0.7)
    } else if gradeLevel == "Middle" && colorScheme == .dark {
        return .blue
    } else if gradeLevel == "High" && colorScheme == .dark {
        return .green
    } else {
        return .white
    }
}

func colorSchemeDarkmode(colorScheme: ColorScheme) -> Color {
    if colorScheme == .dark {
        return .white
    } else {
        return .black
    }
}








