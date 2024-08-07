//
//  OnboardingData.swift
//  Cluber
//
//  Created by Oliver Park on 5/7/24.
//

import Foundation
import SwiftUI

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
    
    @AppStorage("profileImage") var profileImageData: Data?
    var profileImage: UIImage? {
        get {
            if let data = profileImageData {
                return UIImage(data: data)
            }
            return nil
        }
        set {
            profileImageData = newValue?.jpegData(compressionQuality: 1.0)
        }
    }
}


