//
//  OnboardingData.swift
//  Cluber
//
//  Created by Oliver Park on 5/7/24.
//

import Foundation
import SwiftUI

func CircleColor(gradeLevel: String, colorScheme: ColorScheme) -> Color {
    if gradeLevel == "Elementary" {
        return .yellow
    } else if gradeLevel == "Middle" && colorScheme == .light {
        return .blue.opacity(0.5)
    } else if gradeLevel == "High" && colorScheme == .light {
        return .green.opacity(0.7)
    } else if gradeLevel == "Middle" && colorScheme == .dark {
        return .blue
    } else if gradeLevel == "High" && colorScheme == .dark {
        return .green
    } else {
        return .white
    }
}


class UsernameGradeClass: ObservableObject {
    @AppStorage("schoolGrade") var schoolGrade: String = ""
    @Published var grade: String = "Elementary" {
        didSet {
            if grade.isEmpty {
                fatalError("Grade not initialized in UsernameGradeClass.")
            }
            schoolGrade = grade
        }
    }
    @AppStorage ("userName") var userName: String = ""
    @AppStorage ("gradeYear") var gradeNumber: Int = 1 
    @AppStorage ("memberStatus") var member: String = ""
    @AppStorage ("memberBoolean") var memberBoolean = false 
}


