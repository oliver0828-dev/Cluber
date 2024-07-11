//
//  OnboardingData.swift
//  Cluber
//
//  Created by Oliver Park on 5/7/24.
//

import Foundation
import SwiftUI

//struct ColorView: View {
//    var body: some View {
//        ZStack{
//            Rectangle()
//                .frame(width: 300, height: 120)
//                .cornerRadius(20)
//                .foregroundStyle(.white.opacity(0.6))
//            VStack {
//                Text("Choose Your Grade")
//                    .foregroundStyle(.black)
//                    .padding(0.2)
//                HStack {
//                   CircleColorView(level: "Elementary")
//                   CircleColorView(level: "Middle")
//                   CircleColorView(level: "High")
//                }
//            }
//                
//        }
//    }
//}


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


//struct CircleColorView: View {
//    @State var level: String
//    var body: some View {
//        VStack {
//            Text(level)
//                .font(.caption2)
//                .fontWeight(.semibold)
//                .foregroundStyle(.black)
//            Circle()
//                .frame(width: 50, height: 50)
//                .foregroundStyle(CircleColor(gradeLevel: level))
//        }
//        
//    }
//}

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


