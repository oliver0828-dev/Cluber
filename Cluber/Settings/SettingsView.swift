//
//  AccountView.swift
//  Cluber
//
//  Created by Oliver Park on 5/20/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    let username: String
    @State var gradeLevel = "Elementary"
    let grade: [String] = ["Elementary", "Middle", "High"]
    
    @AppStorage("gradeInt") var gradeInt: Int = 1
    
    
    var body: some View {
        
        NavigationStack {
          List {
              Section {
                  NavigationLink {
                      ChangeGradeSettingsView(gradeLevel: gradeLevel, gradeInt: gradeInt)
                  } label: {
                      HStack {
                          Image(systemName: "\(gradeInt).square.fill")
                              .fontDesign(.rounded)
                              .fontWeight(.semibold)
                          Text("Change Grade")
                              .fontDesign(.rounded)
                      }
                  }
                  
                  Section {
                      NavigationLink {
                          ChangeNameView(name: username)
                      } label: {
                          HStack {
                              Image(systemName: "person.circle.fill")
                                  .fontDesign(.rounded)
                                  .fontWeight(.semibold)
                              Text("Change Username")
                          }
                      }
                      
                      
                  }
              }
            }
            
          .navigationTitle("Settings")
       
        }
    }
}

#Preview {
    SettingsView(username: "Oliver")
        .environmentObject(UsernameGradeClass())

}
