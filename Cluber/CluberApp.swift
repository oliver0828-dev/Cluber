//
//  CluberApp.swift
//  Cluber
//
//  Created by Oliver Park on 4/23/24.
//

import SwiftUI

@main
struct CluberApp: App {
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

