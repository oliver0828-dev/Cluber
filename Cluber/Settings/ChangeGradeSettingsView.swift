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
                        .submitLabel(.done)
                        .onChange(of: gradeInt) {
                            usernameGrade.schoolGrade = gradeLevelSuggestion(number: gradeInt)
                        }
                }
                
                Section("Suggested Grade Level") {
                    Text("Your Current Grade: \(gradeInt)")
                        .fontWeight(.semibold)
                    Text(usernameGrade.schoolGrade + " School")
                        .fontWeight(.semibold)
                }
                
                Section("Grade Selection") {
                    Picker("Grade", selection: $usernameGrade.schoolGrade) {
                        ForEach(grade, id: \.self) { school in
                            Text(school)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Button {
                        if savedGrade != gradeInt {
                            usernameGrade.gradeNumber = gradeInt
                            savedGrade = gradeInt
                            isChanged.toggle()
                        }
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    } label: {
                        Text("SAVE")
                            .foregroundStyle(.blue)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                    }.alert(isPresented: $isChanged){
                        Alert(title: Text("New Grade: \(usernameGrade.gradeNumber)"), dismissButton: .default(Text("Done")))
                    }
                }
            }
            .fontDesign(.rounded)
            .navigationTitle("Change Grade")
            .onAppear {
                usernameGrade.schoolGrade = gradeLevelSuggestion(number: gradeInt)
                savedGrade = gradeInt
            } .modifier(NavigationBarModifier())
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

