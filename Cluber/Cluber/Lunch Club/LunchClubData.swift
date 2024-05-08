//
//  LunchClubData.swift
//  Cluber
//
//  Created by Oliver Park on 4/23/24.
//

import Foundation
import SwiftUI

func dayOfWeek(for number: Int) -> String {
    switch number {
    case 1:
        return "Monday"
    case 2:
        return "Tuesday"
    case 3:
        return "Wednesday"
    case 4:
        return "Thursday"
    case 5:
        return "Friday"
    default:
        return "Invalid Day"
    }
}

struct LunchClubStruct: Identifiable {
    let id = UUID()
    let clubName: String
    let teacherName: String
    let teacherImage: String
    let groupImage: String
    let description: String
    let dayOfWeek: Int
}

struct LunchClubList {
    static let HighSchool = [
    // Monday
    LunchClubStruct(clubName: "LOVE (LGBTQ+ Organization for Various Ethnicities)", teacherName: "Mr. Cameron", teacherImage: "MrCameron", groupImage: "HSLOVE", description: "Coming Soon", dayOfWeek: 1),
    LunchClubStruct(clubName: "LOVE (LGBTQ+ Organization for Various Ethnicities)", teacherName: "Mr. Cameron", teacherImage: "MrCameron", groupImage: "HSLOVE", description: "Coming Soon", dayOfWeek: 1),
    LunchClubStruct(clubName: "LOVE (LGBTQ+ Organization for Various Ethnicities)", teacherName: "Mr. Cameron", teacherImage: "MrCameron", groupImage: "HSLOVE", description: "Coming Soon", dayOfWeek: 1),
    LunchClubStruct(clubName: "LOVE (LGBTQ+ Organization for Various Ethnicities)", teacherName: "Mr. Cameron", teacherImage: "MrCameron", groupImage: "HSLOVE", description: "Coming Soon", dayOfWeek: 1),
   
    
    
    // Tuesday
    LunchClubStruct(clubName: "NHS (National Honor Society)", teacherName: "Mr. Coleman", teacherImage: "MrColeman", groupImage: "NHS", description: "Coming Soon", dayOfWeek: 2),
    
    ]
    
    static let ElementarySchool = [
        LunchClubStruct(clubName: "LOVE (LGBTQ+ Organization for Various Ethnicities)", teacherName: "Mr. Cameron", teacherImage: "MrCameron", groupImage: "HSLOVE", description: "Coming Soon", dayOfWeek: 1),
        LunchClubStruct(clubName: "LOVE (LGBTQ+ Organization for Various Ethnicities)", teacherName: "Mr. Cameron", teacherImage: "MrCameron", groupImage: "HSLOVE", description: "Coming Soon", dayOfWeek: 1)
    ]
    
    static let MiddleSchool = [
        LunchClubStruct(clubName: "LOVE (LGBTQ+ Organization for Various Ethnicities)", teacherName: "Mr. Cameron", teacherImage: "MrCameron", groupImage: "HSLOVE", description: "Coming Soon", dayOfWeek: 1),
        LunchClubStruct(clubName: "LOVE (LGBTQ+ Organization for Various Ethnicities)", teacherName: "Mr. Cameron", teacherImage: "MrCameron", groupImage: "HSLOVE", description: "Coming Soon", dayOfWeek: 1)
    
    ]
}





