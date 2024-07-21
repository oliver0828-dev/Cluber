//  LunchClubData.swift
//  Cluber
//
//  Created by Oliver Park on 4/23/24.
//

import Foundation
import SwiftUI
import SwiftData

class ClubClass: ObservableObject {
    
}

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
    let groupImage: String
    let subName: String
    let description: String
    let dayOfWeek: Int
    let roomNumber: Int
    var quarter = "All"
    var location: String = " "
    var socialMedia: Bool = false
    var instagramLink: String = ""
    var instagramID: String = ""
    
    var interested: Bool {
        get {
            UserDefaults.standard.bool(forKey: "\(clubName)_interested")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "\(clubName)_interested")
        }
    }
    
    var memberBoolean: Bool {
        get {
            UserDefaults.standard.bool(forKey: "\(clubName)'s member")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "\(clubName)'s member")
        }
    }
}


struct LunchClubList {
    
    // High School
    static let HighSchool = [
    // Monday
        LunchClubStruct(clubName: "LOVE", teacherName: "Mr. Cameron", groupImage: "HSLOVE", subName: "LGBTQ+ Organization for Various Ethnicities", description: "LOVE aims to recognize and respect everyone, no matter what gender / sexual orientation they identify themselves as. We are also working towards creating an environment that opposes discrimination against people part of the LGBTQ+ community.", dayOfWeek: 1, roomNumber: 204),
        
        LunchClubStruct(clubName: "KISBC", teacherName: "Mr. Balint", groupImage: "KISBC", subName: "Korea International Synthetic Biology Cooperative" , description: "KISBC is a club for students aspiring to major in biology, biomedical engineering, and pre-medicine/dental sciences. Students will (1) compose an experimental proposal / systematic review for publication and award, (2) participate in the biology olympiad (e.g., British Biology Olympiad), and (3) host STEM education initiatives for the local and DIS community.", dayOfWeek: 1, roomNumber: 405, socialMedia: true, instagramLink: "https://www.instagram.com/kisbc_dis_official", instagramID: "@kisbc_dis_official"),
        
        LunchClubStruct(clubName: "Sign Language Club", teacherName: "Mr. Lipsky", groupImage: "SLC", subName: "", description: "Sign Language Club is for students who want to learn more about deaf culture and sign language, socialize with deaf people, and collaborate with other clubs. We will be conducting interviews and inviting guest speakers to help us better understand deaf people in our community. We will host various activities such as sign language trivia during advisory period. Ultimately, our goal is to help grow awareness of sign language and the deaf culture in our community.", dayOfWeek: 1, roomNumber: 309),
        
        LunchClubStruct(clubName: "SAAC", teacherName: "Mr. Bergan", groupImage: "SAAC", subName: "Student Athlete Advisory Committee", description: "SAAC is a student-run organization to promote DIS athletics and takes an active role in sports events at DIS. Some of the activities include coaching, refereeing, and scorekeeping.", dayOfWeek: 1, roomNumber: 305, socialMedia: true, instagramLink: "https://www.instagram.com/dis_saac/", instagramID: "@dis_saac"),
        
        LunchClubStruct(clubName: "Gender Education Network", teacherName: "Ms. Wang", groupImage: "GEN", subName: "", description: "Coming Soon", dayOfWeek: 1, roomNumber: 202),
        
        LunchClubStruct(clubName: "Amnesty International", teacherName: "Ms. Loustch", groupImage: "AI", subName: "", description: "Coming Soon", dayOfWeek: 1, roomNumber: 314),
        
        LunchClubStruct(clubName: "Humanitarian Club", teacherName: "Ms. Lualhati", groupImage: "HC", subName: "", description: "Coming Soon", dayOfWeek: 1, roomNumber: 302),
        
        LunchClubStruct(clubName: "Okio Economics Club", teacherName: "Mr. Gall", groupImage: "OEC", subName: "", description: "Coming Soon", dayOfWeek: 1, roomNumber: 301),
       
    // Tuesday
        LunchClubStruct(clubName: "NHS ", teacherName: "Mr. Coleman", groupImage: "NHS", subName: "National Honor Society", description: "The National Honor Society is an organization for high school students which provides an opportunity for students to shine in the areas of the society’s four pillars: scholarship, service, leadership, and character.", dayOfWeek: 2, roomNumber: 0, location: "Presentation Hall"),
        
        
    // Wednesaday
        LunchClubStruct(clubName: "DIS Peer Tutoring Club", teacherName: "Ms. Lualhati", groupImage: "PTC", subName: "", description: "The Peer Tutoring Club is an open, non-judgmental space for the students created by students. We extend a helping hand to students within the DIS community that are willing to learn, aiming to help fellow students gain confidence and further knowledge in their studies. We are able to help students with reviewing tricky concepts, homework questions, and even with overall tips on exam prep including AP exams!", dayOfWeek: 3, roomNumber: 302, socialMedia: true, instagramLink: "https://www.instagram.com/peertutoringclub/", instagramID: "@peertutoringclub"),
        
        LunchClubStruct(clubName: "NCHS", teacherName: "Mr. Zhao", groupImage: "NCHS", subName: "National Chinese Honor Society", description: "The National Chinese Honor Society is a scholastic organization that promotes and recognizes students who demonstrate citizenship, leadership, and community service. The purpose of the National Chinese Honor Society is to encourage its members to become life-long learners in order to gain a better understanding of Chinese language and culture, as well as to play an active role as a contributing global citizen in the twenty-first century.", dayOfWeek: 3, roomNumber: 213, socialMedia: true, instagramLink: "https://www.instagram.com/dis_chinesehs/", instagramID: "@dis_chinesehs"),
        
        LunchClubStruct(clubName: "Prom Committee", teacherName: "Mrs. Gum", groupImage: "PROM", subName: "", description: "Prom is the biggest party of the year, where we celebrate the end of school and the graduation of the senior class. Prom Committee members will work toward planning, organizing and fundraising for this memorable and important right of passage.", dayOfWeek: 3, roomNumber: 0, location: "Art Studio" ),
        
        LunchClubStruct(clubName: "Yang-ro-won Picture Service Club", teacherName: "Mr. Lipsky", groupImage: "YPSC", subName: "", description: "We are going to take funeral photos for the less fortunate people in elder community centers because most of them cannot even afford a photo of themselves at their own funeral. During school, we are going to learn the basics of photography.", dayOfWeek: 3, roomNumber: 309, socialMedia: true, instagramLink: "https://www.instagram.com/yangrowon_service/", instagramID: "@yangrowon_service"),
        
        LunchClubStruct(clubName: "JBS", teacherName: "Mr. Jolly", groupImage: "JBS", subName: "Jets Broadcasting Service", description: "JBS (Jets Broadcasting Service) is a student-led lunch club where students will be able to turn on Jets Morning Music and speak in the announcements themselves! It also creates enthusiastic energy for students to begin their day. If the covid situation subsides, then we will host many events that our school will enjoy (eg. On a Friday that is the end of the month, we will receive school-appropriate stories from students that are fun, entertaining, or concerning.) and announce them too!", dayOfWeek: 3, roomNumber: 0, location: "Jets Stream Studio"),
        
        LunchClubStruct(clubName: "DSAA", teacherName: "Ms. Coleman", groupImage: "DSAA", subName: "Daegu Student Animal Association", description: "The Daegu Student Animal Association is for those who are interested in communicating with different people and helping animals. We will help out in shelters and actively discuss and promote different animal issues. Moreover, in this community there are many non-Korean speakers that want to help out in shelters but encounter difficulties as it is hard for them to contact or communicate with Korean shelters or other rescuers. The members of the Daegu Student Animal Association can bridge this language border.", dayOfWeek: 3, roomNumber: 201, socialMedia: true, instagramLink: "https://www.instagram.com/dsaa_dis/", instagramID: "@dsaa_dis"),
        
        LunchClubStruct(clubName: "Emerging Medical Students Association", teacherName: "Ms. Wang", groupImage: "EMSA", subName: "", description: "Coming Soon", dayOfWeek: 3, roomNumber: 202),
        
        LunchClubStruct(clubName: "Research 101", teacherName: "Ms. Loustch", groupImage: "R1", subName: "", description: "Coming Soon", dayOfWeek: 3, roomNumber: 314, socialMedia: true, instagramLink: "https://www.instagram.com/disresearch101/", instagramID: "@disresearch101"),
        
        LunchClubStruct(clubName: "GIDAS", teacherName: "Mr. Balint", groupImage: "GIDAS", subName: "Genes In Diseases and Symptoms Club", description: "Coming Soon", dayOfWeek: 3, roomNumber: 405, socialMedia: true, instagramLink: "https://www.instagram.com/disgidas/", instagramID: "@disgidas"),
        
        // Thursday
        LunchClubStruct(clubName: "HSSC", teacherName: "Mr. Hutchings", groupImage: "HSSC", subName: "High School Student Council", description: "High School Student Council is responsible for building up the DIS Student Community and developing engaging events and activities for the student's to enjoy. High School Student Council is a student led group.", dayOfWeek: 4, roomNumber: 0, location: "Music Room", socialMedia: true, instagramLink: "https://www.instagram.com/dis_hssc_official/", instagramID: "@dis_hssc_official"),
        
        LunchClubStruct(clubName: "NAHS", teacherName: "Mr. Gum", groupImage: "n/a", subName: "National Art Honors Society", description: "The NAHS (HS) and NJAHS (MS) programs are designed by the National Art Education Association (NAEA) to support and recognize students who have shown outstanding abilities in art. The NAHS and NJAHS programs support student members in their goal of attaining the highest standards in visual arts. NAHS offers students opportunities for national recognition, scholarships, and connectivity to 58,000+ outstanding art students.", dayOfWeek: 4, roomNumber: 0, location: "Art Studio"),
        
        LunchClubStruct(clubName: "Greenpeace", teacherName: "Mrs. Lopez", groupImage: "GP", subName: "", description: "Coming Soon", dayOfWeek: 4, roomNumber: 210),
        
        LunchClubStruct(clubName: "YANA", teacherName: "Mr. Balint", groupImage: "YANA", subName: "You Are Not Alone", description: "Coming Soon", dayOfWeek: 4, roomNumber: 0, location: "Dorm Lobby", socialMedia: true, instagramLink: "https://www.instagram.com/yanafromdis/", instagramID: "@yanafromdis"),
        
        LunchClubStruct(clubName: "RSIR", teacherName: "Mrs. Jolly", groupImage: "RSIR", subName: "Research and Services for Immigrants and Refugees", description: "Coming Soon", dayOfWeek: 4, roomNumber: 0, location: "Conference Room 2", socialMedia: true, instagramLink: "https://www.instagram.com/dis_rsir/", instagramID: "@dis_rsir"),
        
        LunchClubStruct(clubName: "Minhwa Club", teacherName: "Ms. Wang", groupImage: "MC", subName: "", description: "Coming Soon", dayOfWeek: 4, roomNumber: 205),
        
        LunchClubStruct(clubName: "Veterans in Our Hearts", teacherName: "Mr. Bergan", groupImage: "VIOH", subName: "", description: "Coming Soon", dayOfWeek: 4, roomNumber: 305, socialMedia: true, instagramLink: "https://www.instagram.com/dis_vioh/", instagramID: "@dis_vioh"),
        
        // Friday
        LunchClubStruct(clubName: "HS Key Club", teacherName: "Mrs. Jolly", groupImage: "MSKeyClub", subName: "", description: "Coming Soon", dayOfWeek: 5, roomNumber: 0, location: "Conference Room 2", socialMedia: true, instagramLink: "https://www.instagram.com/keyclub_dis/", instagramID: "@keyclub_dis"),
        
        LunchClubStruct(clubName: "DECA", teacherName: "Mr. Kaschub", groupImage: "DECA", subName: "", description: "DECA is a lunch club for students interested in business. Students will discuss and learn about different marketing and business strategies through fundraising competitions and other activities.", dayOfWeek: 5, roomNumber: 310, socialMedia: true, instagramLink: "https://www.instagram.com/dis_deca/", instagramID: "@dis_deca"),
        
        LunchClubStruct(clubName: "SNHS", teacherName: "Ms. Lualhati", groupImage: "SNHS", subName: "Science National Honor Society", description: "The purpose of Science National Honors Society is to encourage participation in and recognition of scientific and intellectual thought, to advance the students’ knowledge of classical and modern science, to communicate with the scientific community, to aid the civic community with its comprehension of science, and to encourage students to participate in community service and, in turn, encourage a dedication to the pursuit of scientific knowledge that benefits all mankind.", dayOfWeek: 5, roomNumber: 301, socialMedia: true, instagramLink: "https://www.instagram.com/dis_snhs/", instagramID: "@dis_snhs"),
        
        LunchClubStruct(clubName: "Africa Asia Development Relief Foundation", teacherName: "Ms. Loustch", groupImage: "AADRF", subName: "", description: "Coming Soon", dayOfWeek: 5, roomNumber: 314),
        
        LunchClubStruct(clubName: "Ecolution", teacherName: "Mrs. Lopez", groupImage: "ECO", subName: "", description: "Coming Soon", dayOfWeek: 5, roomNumber: 210, socialMedia: true, instagramLink: "https://www.instagram.com/ecolution.cs/", instagramID: "@ecolution.cs"),
        
        LunchClubStruct(clubName: "High School Math Team", teacherName: "Ms. Wang", groupImage: "HSMT", subName: "", description: "Coming Soon", dayOfWeek: 5, roomNumber: 202),
        
        LunchClubStruct(clubName: "DISE", teacherName: "Mr. Jolly", groupImage: "DISE", subName: "DIS Enhancement", description: "Coming Soon", dayOfWeek: 5, roomNumber: 110),
        
        LunchClubStruct(clubName: "HS SOAR", teacherName: "Mr. Bergan", groupImage: "HSSOAR", subName: "Student Organized Against Racism", description: "Coming Soon", dayOfWeek: 5, roomNumber: 305, socialMedia: true, instagramLink: "https://www.instagram.com/dis_soar/", instagramID: "@dis_soar"),
        
        LunchClubStruct(clubName: "Chess Club", teacherName: "Mr. Coleman", groupImage: "CC", subName: "", description: "Coming Soon", dayOfWeek: 5, roomNumber: 201),
        
        LunchClubStruct(clubName: "Disabilities Awareness Club", teacherName: "Mr. Lipsky", groupImage: "DAC", subName: "", description: "Coming Soon", dayOfWeek: 5, roomNumber: 309)
    ]
    
    static let ElementarySchool = [
        // Monday
        LunchClubStruct(clubName: "Kids In Action", teacherName: "Mr. Jolly", groupImage: "KIA", subName: "", description: "Coming Soon", dayOfWeek: 1, roomNumber: 110),
        
        // Tuesday
        LunchClubStruct(clubName: "NEHS", teacherName: "Ms. Downie", groupImage: "NEHS", subName: "National Elementary Honor Society", description: "Coming Soon", dayOfWeek: 2, roomNumber: 101),
        
        // Thursday
        LunchClubStruct(clubName: "ES Student Council", teacherName: "Ms. Bielec", groupImage: "ESSC", subName: "Elementary School Student Council", description: "Coming Soon", dayOfWeek: 4, roomNumber: 102),
        
        // Friday
        LunchClubStruct(clubName: "ES SOAR", teacherName: "Ms. Morissette", groupImage: "ESSOAR", subName: "Student Organized Against Racism", description: "Coming Soon", dayOfWeek: 5, roomNumber: 207, socialMedia: true, instagramLink: "https://www.instagram.com/dis_soar/", instagramID: "@dis_soar")
    ]
    
    static let MiddleSchool = [
        // Monday
        LunchClubStruct(clubName: "MS SOAR", teacherName: "Mr. Bergan", groupImage: "MSSOAR", subName: "Student Organized Against Racism", description: "Coming Soon", dayOfWeek: 1, roomNumber: 305, socialMedia: true, instagramLink: "https://www.instagram.com/dis_soar/", instagramID: "@dis_soar"),
        
        // Tuesday
        LunchClubStruct(clubName: "MSSC", teacherName: "Mrs. Jolly", groupImage: "MSSC", subName: "Middle School Student Council", description: "Coming Soon", dayOfWeek: 2, roomNumber: 0, location: "Presentation Hall", socialMedia: true, instagramLink: "https://www.instagram.com/dis.mssc/", instagramID: "@dis.mssc"),
        
        LunchClubStruct(clubName: "Girl Scouts", teacherName: "Mrs. Cameron", groupImage: "", subName: "", description: "Coming Soon", dayOfWeek: 2, roomNumber: 0, location: "Conference Room 2"),
        
        // Wednesday
        
        LunchClubStruct(clubName: "MS Key Club", teacherName: "Mrs. Jolly", groupImage: "MSKeyClub", subName: "", description: "Coming Soon", dayOfWeek: 3, roomNumber: 0, location: "Conference Room 2", socialMedia: true, instagramLink: "https://www.instagram.com/keyclub_dis/", instagramID: "@keyclub_dis"),
        
    
        // Thursday
        
        LunchClubStruct(clubName: "NJHS", teacherName: "Mr. Lipsky", groupImage: "NJHS", subName: "National Junior Honor Society", description: "Coming Soon", dayOfWeek: 4, roomNumber: 309),
        
        // Friday
        LunchClubStruct(clubName: "LOVE ", teacherName: "Mr. Cameron", groupImage: "MSLOVE", subName: "LGBTQ+ Organization for Various Ethnicities", description: "Coming Soon", dayOfWeek: 5, roomNumber: 204)
    
    ]
}





