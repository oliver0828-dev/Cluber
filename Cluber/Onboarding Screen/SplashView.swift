//
//  SplashView.swift
//  Cluber
//
//  Created by Oliver Park on 8/2/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isLoading = true
    
    var body: some View {
        if isLoading {
            Text("Cluber")
                .task {
                    try? await Task.sleep(for: .seconds(1))
                    isLoading = false
                }
        } else {
            OnboardingView()
        }
    }
}

#Preview {
    SplashView()
        .environmentObject(UsernameGradeClass())
}
