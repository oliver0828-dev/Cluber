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
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environmentObject(usernameGrade)
        }
    }
}

