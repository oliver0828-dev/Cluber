//
//  ChangeNameView.swift
//  Cluber
//
//  Created by Oliver Park on 6/14/24.
//

import SwiftUI

struct ChangeNameView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @State var name: String
    @AppStorage ("username") var username: String = ""
    @State var isTapped = false
    
    @State private var hapticCount = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 350, height: 50)
                        .foregroundStyle(.gray.opacity(0.4))
                    
                    TextField("Username", text: $name)
                        .font(.title3.bold())
                        .fontDesign(.rounded)
                        .frame(width: 300, height: 50)
                        .submitLabel(.done)
                        .padding()
                }
                Button {
                    usernameGrade.userName = name
                    isTapped.toggle()
                    hapticCount += 1
                } label: {
                    Text("SAVE")
                        .fontDesign(.rounded)
                        .foregroundStyle(.white)
                        .frame(width: 120, height: 50)
                        .background(.blue)
                        .clipShape(.capsule)
                }
                .sensoryFeedback(.impact, trigger: hapticCount)
                .alert(isPresented: $isTapped) {
                    Alert(title: Text("New Name: \(usernameGrade.userName)"), dismissButton: .default(Text("Done")))
                }.fontDesign(.rounded)
            }
            Spacer()
            .navigationTitle("Change Username")
        }
        
    }
}

#Preview {
    ChangeNameView(name: "Oliver")
        .environmentObject(UsernameGradeClass())
}
