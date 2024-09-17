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
       
    if showingLaunchScreen && savedName.isEmpty {
        GeometryReader { _ in
            
            ZStack {
                VStack {
                    Spacer()
                    Text("Welcome to Cluber!")
                        .foregroundStyle(Color(red: 0.36, green: 0.36, blue: 0.36))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    if gradeLevel == "Elementary" {
                        Image("gliderYellow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                    } else if gradeLevel == "Middle" {
                        Image("gliderPink")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                    } else {
                        Image("gliderOrange")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                    }
                    
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 351, height: 46)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(23)
                        
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
                        Picker("Grade", selection: $gradeLevel) {
                            ForEach(grade, id: \.self) { school in
                                Text(school)
                            }
                        }
                        
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    HStack {
                        Text("Grade")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(red: 0, green: 0.5, blue: 0.59))
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: 248, height: 46)
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(23)
                            TextField("", value: $gradeInt, formatter: NumberFormatter())
                                .fontDesign(.rounded)
                                .frame(width: 20, height: 50)
                                .foregroundStyle(colorSchemeDarkmode(colorScheme: colorScheme))
                                .submitLabel(.done)
                        }
                    }
                    
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
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: 368, height: 66)
                                .background(Color(red: 0, green: 0.5, blue: 0.59))
                                .cornerRadius(33)
                            Text("Get Started")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                            
                        }
                    }
                    .alert(isPresented: $isPresented) {
                        Alert (title: Text("Please check your inputs"))
                    }
                    Spacer()
                    
                    
                }
                .fontDesign(.rounded)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .transition(.move(edge: .bottom))
                .padding()
            }
        }.background(onboardingScreenColor(grade: gradeLevel))
            } else {
                ContentView(username: $savedName, gradeLevel: $gradeLevel)
            }
      
    
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
    
    func onboardingScreenColor(grade: String) -> Color {
        if gradeLevel == "Elementary" {
            return Color.yellow.opacity(0.5)
        } else if gradeLevel == "Middle" {
            return Color.red.opacity(0.5)
        } else {
            return Color.orange.opacity(0.7)
        }
    }
}




#Preview {
    OnboardingView()
        .preferredColorScheme(.light)
        .environmentObject(UsernameGradeClass())
        .environmentObject(PhotoPickerViewModel())
    
}


func colorSchemeDarkmode(colorScheme: ColorScheme) -> Color {
    if colorScheme == .dark {
        return .white
    } else {
        return .black
    }
}








