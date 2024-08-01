//
//  AccountView.swift
//  Cluber
//
//  Created by Oliver Park on 5/20/24.
//

import SwiftUI
import PhotosUI

struct SettingsView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    let username: String
    @State var gradeLevel = "Elementary"
    let grade: [String] = ["Elementary", "Middle", "High"]
    
    @AppStorage("gradeInt") var gradeInt: Int = 1
    
    
    var body: some View {
        
        NavigationStack {
            List {
                Section("Your Profile") {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        VStack (alignment: .leading) {
                            Text(usernameGrade.userName)
                                .font(.title3.bold())
                            HStack {
                                Text(usernameGrade.schoolGrade + " School")
                                    .foregroundStyle(.secondary)
                                Image(systemName: "\(usernameGrade.gradeNumber).circle")
                            }
                        }.padding()
                    }
                }
                Section ("Edit Your Profile") {
                    NavigationLink {
                        ChangeGradeSettingsView(gradeLevel: gradeLevel, gradeInt: gradeInt)
                    } label: {
                        HStack {
                            Image(systemName: "\(gradeInt).square.fill")
                                .fontWeight(.semibold)
                            Text("Change Grade")
                        }
                    }
                    
                    Section {
                        NavigationLink {
                            ChangeProfileView(name: username)
                        } label: {
                            HStack {
                                Image(systemName: "person.circle.fill")
                                    .fontWeight(.semibold)
                                Text("Change Profile")
                            }
                        }
                    }
                }
                
                Section ("Check for Updates") {
                    HStack {
                        Image(systemName: "doc.plaintext.fill")
                        Link("Update Notes", destination: URL(string: "https://ollie-dev.notion.site/Cluber-eb40f2c0f3f14d66a5c47165fda28ad9?pvs=4")!)
                            .foregroundStyle(.primary)
                    }
                    
                }
                
                .navigationTitle("Settings")
                
            }
        }
    }
}

#Preview {
    SettingsView(username: "Oliver")
        .environmentObject(UsernameGradeClass())
}
