//
//  ChangeGradeSettingsView.swift
//  Cluber
//
//  Created by Oliver Park on 6/14/24.
//

import SwiftUI

struct ChangeGradeSettingsView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    
    let grade: [String] = ["Elementary", "Middle", "High"]
    @State var isTapped = false
    @State var isChanged = false // for the save button
    @State var gradeLevel: String = ""
    
    @AppStorage("gradeInt") var gradeInt: Int = 1
    @State var savedGrade: Int = 1 // to track the currently saved grade
    
    var body: some View {
        NavigationStack {
            List {
                Section("Grade Year") {
                    TextField("Grade", value: $gradeInt, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .submitLabel(.done)
                        .onChange(of: gradeInt) {
                            usernameGrade.schoolGrade = gradeLevelSuggestion(number: gradeInt)
                        }
                }
                .fontDesign(.rounded)
                
                Section("Suggested Grade Level") {
                    Text("Your Current Grade: \(gradeInt)")
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                    Text(usernameGrade.schoolGrade + " School")
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                }
                .fontDesign(.rounded)
                
                Section("Grade Selection") {
                    Picker("Grade", selection: $usernameGrade.schoolGrade) {
                        ForEach(grade, id: \.self) { school in
                            Text(school)
                                .fontDesign(.rounded)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .fontDesign(.rounded)
                
                Section {
                    Button {
                        if savedGrade != gradeInt {
                            withAnimation {
                                usernameGrade.gradeNumber = gradeInt
                                savedGrade = gradeInt
                                isChanged = true
                            }
                        }
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    } label: {
                        Text("SAVE")
                            .foregroundStyle(.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                    }
                }.listRowBackground(Color.blue)
            }
            .navigationTitle("Change Grade")
            .onAppear {
                usernameGrade.schoolGrade = gradeLevelSuggestion(number: gradeInt)
                savedGrade = gradeInt
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
            return "No Suggestion"
        }
    }
}

#Preview {
    ChangeGradeSettingsView()
        .environmentObject(UsernameGradeClass())
}

