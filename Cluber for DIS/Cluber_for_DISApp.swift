//
//  Cluber_for_DISApp.swift
//  Cluber for DIS
//
//  Created by Oliver Park on 9/13/24.
//

import SwiftUI

@main
struct Cluber_for_DISApp: App {
    @StateObject var usernameGrade = UsernameGradeClass()
    @StateObject var photoImage = PhotoPickerViewModel()

       
       var body: some Scene {
           WindowGroup {
              OnboardingView()
                   .preferredColorScheme(.light)
                   .environmentObject(usernameGrade)
                   .environmentObject(photoImage)
           }
       }
}
