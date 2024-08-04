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
    var subName: String = ""
    let description: String
    let dayOfWeek: Int
    let roomNumber: Int
    var quarter = "All"
    var location: String = " "
    var socialMedia: Bool = false
    var instagramLink: String = ""
    var instagramID: String = ""
    var aiGenerated: Bool = false
    
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
        
        LunchClubStruct(clubName: "Sign Language Club", teacherName: "Mr. Lipsky", groupImage: "SLC", description: "Sign Language Club is for students who want to learn more about deaf culture and sign language, socialize with deaf people, and collaborate with other clubs. We will be conducting interviews and inviting guest speakers to help us better understand deaf people in our community. We will host various activities such as sign language trivia during advisory period. Ultimately, our goal is to help grow awareness of sign language and the deaf culture in our community.", dayOfWeek: 1, roomNumber: 309),
        
        LunchClubStruct(clubName: "SAAC", teacherName: "Mr. Bergan", groupImage: "SAAC", subName: "Student Athlete Advisory Committee", description: "SAAC is a student-run organization to promote DIS athletics and takes an active role in sports events at DIS. Some of the activities include coaching, refereeing, and scorekeeping.", dayOfWeek: 1, roomNumber: 305, socialMedia: true, instagramLink: "https://www.instagram.com/dis_saac/", instagramID: "@dis_saac"),
        
        LunchClubStruct(clubName: "Gender Education Network", teacherName: "Ms. Wang", groupImage: "GEN", description: "The Gender Education Network strives to promote gender equity and provide educational resources about gender diversity. Our goal is to foster a deeper understanding of gender issues among students and faculty through workshops, speaker events, and partnerships with community organizations.", dayOfWeek: 1, roomNumber: 202, aiGenerated: true),
        
        LunchClubStruct(clubName: "Amnesty International", teacherName: "Ms. Loustch", groupImage: "AI", description: "Amnesty International at DIS focuses on raising awareness about human rights abuses worldwide. Members engage in advocacy efforts, educational activities, and campaigns to support Amnesty International's global missions and foster a culture of human rights advocacy within the school community.", dayOfWeek: 1, roomNumber: 314, aiGenerated: true),
        
        LunchClubStruct(clubName: "Humanitarian Club", teacherName: "Ms. Lualhati", groupImage: "HC", description: "The Humanitarian Club is dedicated to supporting and initiating projects that provide relief and assistance to those in need, both locally and globally. Through fundraising, educational campaigns, and hands-on service projects, we aim to make a tangible difference in the lives of the underserved.", dayOfWeek: 1, roomNumber: 302, aiGenerated: true),
        
        LunchClubStruct(clubName: "Okio Economics Club", teacherName: "Mr. Gall", groupImage: "OEC", description: "The Okio Economics Club fosters an understanding of economic principles among students through interactive discussions, guest lectures, and participation in economic simulations and competitions. The club prepares students for a variety of competitions, including the National Economics Challenge.", dayOfWeek: 1, roomNumber: 301, aiGenerated: true),
       
    // Tuesday
        LunchClubStruct(clubName: "NHS ", teacherName: "Mr. Coleman", groupImage: "NHS", subName: "National Honor Society", description: "The National Honor Society is an organization for high school students which provides an opportunity for students to shine in the areas of the society’s four pillars: scholarship, service, leadership, and character.", dayOfWeek: 2, roomNumber: 0, location: "Presentation Hall"),
        
        
    // Wednesaday
        LunchClubStruct(clubName: "DIS Peer Tutoring Club", teacherName: "Ms. Lualhati", groupImage: "PTC", description: "The Peer Tutoring Club is an open, non-judgmental space for the students created by students. We extend a helping hand to students within the DIS community that are willing to learn, aiming to help fellow students gain confidence and further knowledge in their studies. We are able to help students with reviewing tricky concepts, homework questions, and even with overall tips on exam prep including AP exams!", dayOfWeek: 3, roomNumber: 302, socialMedia: true, instagramLink: "https://www.instagram.com/peertutoringclub/", instagramID: "@peertutoringclub"),
        
        LunchClubStruct(clubName: "NCHS", teacherName: "Mr. Zhao", groupImage: "NCHS", subName: "National Chinese Honor Society", description: "The National Chinese Honor Society is a scholastic organization that promotes and recognizes students who demonstrate citizenship, leadership, and community service. The purpose of the National Chinese Honor Society is to encourage its members to become life-long learners in order to gain a better understanding of Chinese language and culture, as well as to play an active role as a contributing global citizen in the twenty-first century.", dayOfWeek: 3, roomNumber: 213, socialMedia: true, instagramLink: "https://www.instagram.com/dis_chinesehs/", instagramID: "@dis_chinesehs"),
        
        LunchClubStruct(clubName: "Prom Committee", teacherName: "Mrs. Gum", groupImage: "PROM", description: "Prom is the biggest party of the year, where we celebrate the end of school and the graduation of the senior class. Prom Committee members will work toward planning, organizing and fundraising for this memorable and important right of passage.", dayOfWeek: 3, roomNumber: 0, location: "Art Studio" ),
        
        LunchClubStruct(clubName: "Yang-ro-won Picture Service Club", teacherName: "Mr. Lipsky", groupImage: "YPSC", description: "We are going to take funeral photos for the less fortunate people in elder community centers because most of them cannot even afford a photo of themselves at their own funeral. During school, we are going to learn the basics of photography.", dayOfWeek: 3, roomNumber: 309, socialMedia: true, instagramLink: "https://www.instagram.com/yangrowon_service/", instagramID: "@yangrowon_service"),
        
        LunchClubStruct(clubName: "JBS", teacherName: "Mr. Jolly", groupImage: "JBS", subName: "Jets Broadcasting Service", description: "JBS (Jets Broadcasting Service) is a student-led lunch club where students will be able to turn on Jets Morning Music and speak in the announcements themselves! It also creates enthusiastic energy for students to begin their day. If the covid situation subsides, then we will host many events that our school will enjoy (eg. On a Friday that is the end of the month, we will receive school-appropriate stories from students that are fun, entertaining, or concerning.) and announce them too!", dayOfWeek: 3, roomNumber: 0, location: "Jets Stream Studio"),
        
        LunchClubStruct(clubName: "DSAA", teacherName: "Ms. Coleman", groupImage: "DSAA", subName: "Daegu Student Animal Association", description: "The Daegu Student Animal Association is for those who are interested in communicating with different people and helping animals. We will help out in shelters and actively discuss and promote different animal issues. Moreover, in this community there are many non-Korean speakers that want to help out in shelters but encounter difficulties as it is hard for them to contact or communicate with Korean shelters or other rescuers. The members of the Daegu Student Animal Association can bridge this language border.", dayOfWeek: 3, roomNumber: 201, socialMedia: true, instagramLink: "https://www.instagram.com/dsaa_dis/", instagramID: "@dsaa_dis"),
        
        LunchClubStruct(clubName: "Emerging Medical Students Association", teacherName: "Ms. Wang", groupImage: "EMSA", description: "The Emerging Medical Students Association offers students a platform to explore medical and healthcare careers through workshops, guest lectures, and field trips. It aims to inspire future healthcare professionals by providing early insights into medical sciences and practical experiences.", dayOfWeek: 3, roomNumber: 202, aiGenerated: true),
        
        LunchClubStruct(clubName: "Research 101", teacherName: "Ms. Loustch", groupImage: "R1", description: "Research 101 helps students understand the essentials of academic research, including methodology, data analysis, and scholarly writing. The club prepares students for higher education and potential research opportunities through practical workshops and peer collaboration.", dayOfWeek: 3, roomNumber: 314, socialMedia: true, instagramLink: "https://www.instagram.com/disresearch101/", instagramID: "@disresearch101", aiGenerated: true),
        
        LunchClubStruct(clubName: "GIDAS", teacherName: "Mr. Balint", groupImage: "GIDAS", subName: "Genes In Diseases and Symptoms Club", description: "GIDAS focuses on the study of genetic influences on diseases and symptoms, offering students the chance to engage in hands-on research and discussions on cutting-edge topics in genetics and biomedicine. Members can participate in projects and competitions that enhance their understanding of genetics’ role in medicine.", dayOfWeek: 3, roomNumber: 405, socialMedia: true, instagramLink: "https://www.instagram.com/disgidas/", instagramID: "@disgidas", aiGenerated: true),
        
        // Thursday
        LunchClubStruct(clubName: "HSSC", teacherName: "Mr. Hutchings", groupImage: "HSSC", subName: "High School Student Council", description: "High School Student Council is responsible for building up the DIS Student Community and developing engaging events and activities for the student's to enjoy. High School Student Council is a student led group.", dayOfWeek: 4, roomNumber: 0, location: "Music Room", socialMedia: true, instagramLink: "https://www.instagram.com/dis_hssc_official/", instagramID: "@dis_hssc_official"),
        
        LunchClubStruct(clubName: "NAHS", teacherName: "Mr. Gum", groupImage: "n/a", subName: "National Art Honors Society", description: "The NAHS (HS) and NJAHS (MS) programs are designed by the National Art Education Association (NAEA) to support and recognize students who have shown outstanding abilities in art. The NAHS and NJAHS programs support student members in their goal of attaining the highest standards in visual arts. NAHS offers students opportunities for national recognition, scholarships, and connectivity to 58,000+ outstanding art students.", dayOfWeek: 4, roomNumber: 0, location: "Art Studio"),
        
        LunchClubStruct(clubName: "Greenpeace", teacherName: "Mrs. Lopez", groupImage: "GP", description: "Greenpeace at DIS engages students in environmental activism and sustainability projects. The club organizes events such as clean-ups, educational workshops, and campaigns to promote environmental awareness and action within the school and local community.", dayOfWeek: 4, roomNumber: 210, aiGenerated: true),
        
        LunchClubStruct(clubName: "YANA", teacherName: "Mr. Balint", groupImage: "YANA", subName: "You Are Not Alone", description: "YANA provides a support network for students facing mental health challenges. Through regular meetings, peer support sessions, and awareness campaigns, YANA aims to destigmatize mental health issues and foster a supportive community environment.", dayOfWeek: 4, roomNumber: 0, location: "Dorm Lobby", socialMedia: true, instagramLink: "https://www.instagram.com/yanafromdis/", instagramID: "@yanafromdis", aiGenerated: true),
        
        LunchClubStruct(clubName: "RSIR", teacherName: "Mrs. Jolly", groupImage: "RSIR", subName: "Research and Services for Immigrants and Refugees", description: "RSIR is dedicated to supporting immigrants and refugees through research and direct service initiatives. The club collaborates with local organizations to provide resources, conduct impactful research, and organize events that help integrate and support these communities.", dayOfWeek: 4, roomNumber: 0, location: "Conference Room 2", socialMedia: true, instagramLink: "https://www.instagram.com/dis_rsir/", instagramID: "@dis_rsir", aiGenerated: true),
        
        LunchClubStruct(clubName: "Minhwa Club", teacherName: "Ms. Wang", groupImage: "MC", description: " Minhwa Club explores traditional Korean folk art, offering students a hands-on experience in painting and understanding the cultural and historical context of minhwa. The club also hosts exhibitions and cultural exchange events to celebrate and share Korean heritage.", dayOfWeek: 4, roomNumber: 205, aiGenerated: true),
        
        LunchClubStruct(clubName: "Veterans in Our Hearts", teacherName: "Mr. Bergan", groupImage: "VIOH", description: "Veterans in Our Hearts fosters respect and support for military veterans. The club engages in activities such as letter-writing campaigns, visits to veteran homes, and educational events to honor and support veterans within and beyond the school community.", dayOfWeek: 4, roomNumber: 305, socialMedia: true, instagramLink: "https://www.instagram.com/dis_vioh/", instagramID: "@dis_vioh", aiGenerated: true),
        
        // Friday
        LunchClubStruct(clubName: "HS Key Club", teacherName: "Mrs. Jolly", groupImage: "MSKeyClub", description: "Key Club is a growing organization with global reach. With 1000s of clubs in 45 countries, the impact of Key Club members can be felt all over the world. \n Key Club members around the world are learning how to lead and stand for what’s right through service and volunteerism. In partnership with their local Kiwanis club, high school students are making a positive impact as they serve others in their schools and communities.", dayOfWeek: 5, roomNumber: 0, location: "Conference Room 2", socialMedia: true, instagramLink: "https://www.instagram.com/keyclub_dis/", instagramID: "@keyclub_dis"),
        
        LunchClubStruct(clubName: "DECA", teacherName: "Mr. Kaschub", groupImage: "DECA", subName: "", description: "DECA is a lunch club for students interested in business. Students will discuss and learn about different marketing and business strategies through fundraising competitions and other activities.", dayOfWeek: 5, roomNumber: 310, socialMedia: true, instagramLink: "https://www.instagram.com/dis_deca/", instagramID: "@dis_deca"),
        
        LunchClubStruct(clubName: "SNHS", teacherName: "Ms. Lualhati", groupImage: "SNHS", subName: "Science National Honor Society", description: "The purpose of Science National Honors Society is to encourage participation in and recognition of scientific and intellectual thought, to advance the students’ knowledge of classical and modern science, to communicate with the scientific community, to aid the civic community with its comprehension of science, and to encourage students to participate in community service and, in turn, encourage a dedication to the pursuit of scientific knowledge that benefits all mankind.", dayOfWeek: 5, roomNumber: 301, socialMedia: true, instagramLink: "https://www.instagram.com/dis_snhs/", instagramID: "@dis_snhs"),
        
        LunchClubStruct(clubName: "Africa Asia Development Relief Foundation", teacherName: "Ms. Loustch", groupImage: "AADRF", description: "AADRF focuses on addressing and supporting developmental and relief efforts in Africa and Asia. Through fundraising, awareness campaigns, and partnership with international NGOs, the club aims to make a significant impact on improving living conditions and providing educational opportunities in these regions.", dayOfWeek: 5, roomNumber: 314, aiGenerated: true),
        
        LunchClubStruct(clubName: "Ecolution", teacherName: "Mrs. Lopez", groupImage: "ECO", description: "Ecolution promotes environmental sustainability through student-led initiatives and community engagement. Members participate in projects that focus on recycling, renewable energy, and conservation efforts to foster a greener campus and community.", dayOfWeek: 5, roomNumber: 210, socialMedia: true, instagramLink: "https://www.instagram.com/ecolution.cs/", instagramID: "@ecolution.cs", aiGenerated: true),
        
        LunchClubStruct(clubName: "High School Math Team", teacherName: "Ms. Wang", groupImage: "HSMT", description: "The High School Math Team provides students with opportunities to challenge and enhance their mathematical skills through competitions and problem-solving sessions. The club aims to foster a deep appreciation for mathematics and to develop strong analytical and reasoning abilities among its members.", dayOfWeek: 5, roomNumber: 202, aiGenerated: true),
        
        LunchClubStruct(clubName: "DISE", teacherName: "Mr. Jolly", groupImage: "DISE", subName: "DIS Enhancement", description: "ISE aims to improve the school environment and enhance the overall student experience through projects that focus on school beautification, policy changes, and the introduction of new resources. The club serves as a platform for students to voice their ideas and see them implemented.", dayOfWeek: 5, roomNumber: 110, aiGenerated: true),
        
        LunchClubStruct(clubName: "HS SOAR", teacherName: "Mr. Bergan", groupImage: "HSSOAR", subName: "Student Organized Against Racism", description: "SOAR is committed to promoting racial equality and cultural understanding within the school community. Through educational workshops, speaker series, and cultural events, the club strives to combat racism and foster an inclusive environment for all students.", dayOfWeek: 5, roomNumber: 305, socialMedia: true, instagramLink: "https://www.instagram.com/dis_soar/", instagramID: "@dis_soar", aiGenerated: true),
        
        LunchClubStruct(clubName: "Chess Club", teacherName: "Mr. Coleman", groupImage: "CC", description: "Chess Club offers students the chance to learn and play chess at various skill levels. The club encourages strategic thinking and competition, hosting school tournaments and participating in regional competitions.", dayOfWeek: 5, roomNumber: 201, aiGenerated: true),
        
        LunchClubStruct(clubName: "Disabilities Awareness Club", teacherName: "Mr. Lipsky", groupImage: "DAC", description: "The Disabilities Awareness Club raises awareness and promotes inclusion for individuals with disabilities. Through advocacy, educational events, and collaboration with local organizations, the club seeks to ensure equal opportunities and understanding for all members of the community.", dayOfWeek: 5, roomNumber: 309, aiGenerated: true)
    ]
    
    static let ElementarySchool = [
        // Monday
        LunchClubStruct(clubName: "Kids In Action", teacherName: "Mr. Jolly", groupImage: "KIA", description: "Kids In Action encourages young students to engage in community service and leadership activities from an early age. The club organizes simple, kid-friendly projects that focus on helping others and understanding basic civic responsibilities.", dayOfWeek: 1, roomNumber: 110, aiGenerated: true),

        // Tuesday
        LunchClubStruct(clubName: "NEHS", teacherName: "Ms. Downie", groupImage: "NEHS", subName: "National Elementary Honor Society", description: "NEHS recognizes outstanding elementary students for their achievements and encourages its members to strive for academic excellence while developing skills in leadership and responsibility.", dayOfWeek: 2, roomNumber: 101, aiGenerated: true),

        // Thursday
        LunchClubStruct(clubName: "ES Student Council", teacherName: "Ms. Bielec", groupImage: "ESSC", subName: "Elementary School Student Council", description: "The Elementary School Student Council serves as a voice for the students, helping to organize school activities and fostering a sense of community and spirit among the younger students.", dayOfWeek: 4, roomNumber: 102, aiGenerated: true),

        // Friday
        LunchClubStruct(clubName: "ES SOAR", teacherName: "Ms. Morissette", groupImage: "ESSOAR", subName: "Student Organized Against Racism", description: "ES SOAR promotes understanding and appreciation of diversity among elementary students through education about different cultures and histories, aiming to build a foundation of respect and inclusion.", dayOfWeek: 5, roomNumber: 207, socialMedia: true, instagramLink: "https://www.instagram.com/dis_soar/", instagramID: "@dis_soar", aiGenerated: true)
    ]
    
    static let MiddleSchool = [
        // Monday
        LunchClubStruct(clubName: "MS SOAR", teacherName: "Mr. Bergan", groupImage: "MSSOAR", subName: "Student Organized Against Racism", description: "MS SOAR engages middle school students in dialogues and activities that address issues of race and diversity, aiming to educate and cultivate a supportive and inclusive school environment.", dayOfWeek: 1, roomNumber: 305, socialMedia: true, instagramLink: "https://www.instagram.com/dis_soar/", instagramID: "@dis_soar", aiGenerated: true),

        // Tuesday
        LunchClubStruct(clubName: "MSSC", teacherName: "Mrs. Jolly", groupImage: "MSSC", subName: "Middle School Student Council", description: "The Middle School Student Council represents the student body in school governance and organizes various school-wide events to enhance student life and promote school spirit.", dayOfWeek: 2, roomNumber: 0, location: "Presentation Hall", socialMedia: true, instagramLink: "https://www.instagram.com/dis.mssc/", instagramID: "@dis.mssc", aiGenerated: true),
        
        LunchClubStruct(clubName: "Girl Scouts", teacherName: "Mrs. Cameron", groupImage: "n/a", description: "Girl Scouts in middle school participate in a range of activities from community service projects to learning new skills that foster independence and a strong sense of self. This club helps girls build courage, confidence, and character.", dayOfWeek: 2, roomNumber: 0, location: "Conference Room 2", aiGenerated: true),
  
        // Wednesday
        LunchClubStruct(clubName: "MS Key Club", teacherName: "Mrs. Jolly", groupImage: "MSKeyClub", description: "MS Key Club introduces middle school students to volunteerism and leadership through service to their school and community. The club participates in various local and international service projects.", dayOfWeek: 3, roomNumber: 0, location: "Conference Room 2", socialMedia: true, instagramLink: "https://www.instagram.com/keyclub_dis/", instagramID: "@keyclub_dis"),

        // Thursday
        LunchClubStruct(clubName: "NJHS", teacherName: "Mr. Lipsky", groupImage: "NJHS", subName: "National Junior Honor Society", description: "NJHS honors middle school students who have demonstrated excellence in the areas of scholarship, service, leadership, character, and citizenship, encouraging them to maintain high standards.", dayOfWeek: 4, roomNumber: 309, aiGenerated: true),

        // Friday
        LunchClubStruct(clubName: "LOVE ", teacherName: "Mr. Cameron", groupImage: "MSLOVE", subName: "LGBTQ+ Organization for Various Ethnicities", description: "LOVE provides a supportive environment for middle school students exploring their identity and promotes understanding and acceptance for all sexual orientations and gender identities.", dayOfWeek: 5, roomNumber: 204, aiGenerated: true)
    
    ]
}





