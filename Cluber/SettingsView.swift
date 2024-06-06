//
//  AccountView.swift
//  Cluber
//
//  Created by Oliver Park on 5/20/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @State var username: String
    @State private var gradeLevel = "Elementary"
    let grade: [String] = ["Elementary", "Middle", "High"]
    
    @AppStorage("userName") var savedName: String = ""
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Section("Change Grade Level") {
                    Picker("Grade", selection: $usernameGrade.schoolGrade) {
                        ForEach(grade, id: \.self) { school in
                            Text(school)
                            
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
                
                Divider()
                    .padding()
                
                Section("Change Username"){
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 350, height: 50)
                            .foregroundStyle(.gray.opacity(0.4))
                        TextField("Username", text: $username)
                            .font(.title3.bold())
                            .frame(width: 300, height: 50)
                            .padding()
                        
                    }
                    Button {
                        savedName = username
                    } label: {
                        Text("DONE")
                            .foregroundStyle(.white)
                            .frame(width: 120, height: 50)
                            .background(.blue)
                            .clipShape(.capsule)
                    }
                }
                .navigationTitle("Settings")
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView(username: "Oliver")
        .environmentObject(UsernameGradeClass())
}
