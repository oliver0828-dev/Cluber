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
    
    @AppStorage("gradeInt") var gradeInt: Int = 1
    @AppStorage("userName") var savedName: String = ""
    @AppStorage("gradeLevel") var gradeLevel: String = "Elementary"
    
    let grade: [String] = ["Elementary", "Middle", "High"]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Set background color dynamically based on the grade level for iPad
                if UIDevice.current.userInterfaceIdiom == .pad {
                    GradeColor(gradeLevel: gradeLevel)
                        .edgesIgnoringSafeArea(.all)
                }
                if showingLaunchScreen && savedName.isEmpty {
                ZStack {
                    VStack(alignment: .center) {
                        if UIDevice.current.userInterfaceIdiom == .phone {
                            Image("signUpScreen")
                                .resizable()
                                .frame(maxWidth: .infinity, maxHeight: 1200) // Dynamic sizing
                                .ignoresSafeArea(.all)
                        }
                    }
                    
                    VStack {
                        if UIDevice.current.userInterfaceIdiom != .pad {
                            Text("Welcome to Cluber!")
                                .foregroundStyle(Color(red: 0.36, green: 0.36, blue: 0.36))
                                .font(.title.bold())
                        } else {
                            Text("Welcome to Cluber!")
                                .foregroundStyle(Color(red: 0.36, green: 0.36, blue: 0.36))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                        
                        if gradeLevel == "Elementary" {
                            Image("gliderYellow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        } else if gradeLevel == "Middle" {
                            Image("gliderPink")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        } else {
                            Image("gliderOrange")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        }
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: geometry.size.width * 0.9, height: 46)
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(23)
                            
                            HStack {
                                TextField("Your Firstname Only", text: $name)
                                    .fontDesign(.rounded)
                                    .frame(width: geometry.size.width * 0.8, height: 50)
                                    .foregroundStyle(.black)
                                    .submitLabel(.done)
                                    .padding()
                            }
                        }
                        
                        HStack {
                            Picker("Grade", selection: $gradeLevel) {
                                ForEach(grade, id: \.self) { school in
                                    Text(school)
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                        .pickerStyle(.segmented)
                        .frame(maxWidth: geometry.size.width * 0.8)
                        .padding()

                        
                        HStack {
                            Text("Grade")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(red: 0, green: 0.5, blue: 0.59))
                            ZStack {
                                Rectangle()
                                    .foregroundStyle(.clear)
                                    .frame(width: geometry.size.width * 0.6, height: 46) // Adjusted width
                                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                    .cornerRadius(23)
                                TextField("", value: $gradeInt, formatter: NumberFormatter())
                                    .fontDesign(.rounded)
                                    .frame(width: 40, height: 50)
                                    .submitLabel(.done)
                                    .foregroundStyle(.black)
                            
                            }
                        }
                        
                        
                        Button {
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
                                    .frame(width: geometry.size.width * 0.9, height: 66) // Dynamic width
                                    .background(Color(red: 0, green: 0.5, blue: 0.59))
                                    .cornerRadius(33)
                                Text("Get Started")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                            }
                        }
                        .alert(isPresented: $isPresented) {
                            Alert(title: Text("Please check your inputs"))
                        }
                        
                       
                    }
                    .preferredColorScheme(.light)
                    .fontDesign(.rounded)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .bottom))
                    
                }
                } else {
                    ContentView(username: $savedName, gradeLevel: $gradeLevel)
                        .preferredColorScheme(nil) 
                }
            }
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
}


#Preview {
    OnboardingView()
        .environmentObject(UsernameGradeClass())
        .environmentObject(PhotoPickerViewModel())
}
