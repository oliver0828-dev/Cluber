//
//  OnboardingData.swift
//  Cluber
//
//  Created by Oliver Park on 5/7/24.
//

import Foundation
import SwiftUI

struct ColorView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 300, height: 120)
                .cornerRadius(20)
                .foregroundStyle(.white.opacity(0.6))
            VStack {
                Text("Choose Your Grade")
                    .foregroundStyle(.black)
                    .padding(0.2)
                HStack {
                   CircleColorView(level: "Elementary")
                   CircleColorView(level: "Middle")
                   CircleColorView(level: "High")
                }
            }
                
        }
    }
}


func CircleColor(gradeLevel: String) -> Color {
    if gradeLevel == "Elementary" {
        return .yellow
    } else if gradeLevel == "Middle" {
        return .blue.opacity(0.5)
    } else if gradeLevel == "High"{
        return .green.opacity(0.7)
    } else {
        return .white
    }
}

struct CircleColorView: View {
    @State var level: String
    var body: some View {
        VStack {
            Text(level)
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
            Circle()
                .frame(width: 50, height: 50)
                .foregroundStyle(CircleColor(gradeLevel: level))
        }
        
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
}


