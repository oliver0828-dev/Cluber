//
//  ASAData.swift
//  Cluber
//
//  Created by Oliver Park on 6/2/24.
//

import Foundation

struct ASAStruct: Identifiable {
    let id = UUID()
    let clubName: String
    let teacherName: String
    let groupImage: String
    let subName: String
    let description: String
    let dayOfWeek: Int
    let roomNumber: Int
    var location: String = ""
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
}

struct ASAList {
    static let HighSchool: Array = [
        // Monday
        ASAStruct(clubName: "FAB LAB", teacherName: "Mr. Gum", groupImage: "FL", subName: "Fabrication LAB", description: "Join DIS FAB LAB, a student managed club for students in grades 6 to 12. Make an impact in our school community by assisting teachers with essential services. Use state of the art technology from a professional, wide format printer to 3D printers and an automated vinyl cutter. Collaborate with peers, to provide teacher services such as printing, photocopying, 3D designing and printing", dayOfWeek: 1,roomNumber: 10),
        
        ASAStruct(clubName: "Jets Stream", teacherName: "Mr. Lipsky", groupImage: "JS", subName: "", description: "Jet Streamers will produce news broadcasts. They become journalists, find and report news stories, and broadcast their work on the DISTV YouTube channel", dayOfWeek: 1, roomNumber: 10),
        
        ASAStruct(clubName: "Rummikub Club", teacherName: "Ms. Wang", groupImage: "RC", subName: "", description: "Do you want to have a lot of fun with your friends and Ms. Wang by playing a very exciting board game called Rummikub? Rummikub is a very fun and easy number board game which you can learn easily if you don't know how to play! Ms. Wang is an expert Rummikub player and will help you learn and enjoy a lot. Join and let's have fun together!!!", dayOfWeek: 1, roomNumber: 10),
        
        ASAStruct(clubName: "Beginner Instruments" , teacherName: "Mr. Hutchings", groupImage: "BI", subName: "", description: "Ever wanted to learn a second instrument? Or maybe even your first? This asa is for students who want to explore new instruments. The school has limited supply of extra Instruments to borrow, but if we don't have one you'll have to buy your own, so make sure to contact Mr Hutchings as soon as you sign up to ask about supply.", dayOfWeek: 1, roomNumber: 10)
        
    ]
    
    static let Middle: Array = [
        // Monday
        ASAStruct(clubName: "Basketball", teacherName: "Mr. Bergan", groupImage: "BB", subName: "", description: "Coming Soon", dayOfWeek: 1, roomNumber: 10)
        
    ]
    
    static let Elementary: Array = [
        // Monday
        ASAStruct(clubName: "MockView", teacherName: "Mock", groupImage: "HC", subName: "MOCK", description: "MOCK", dayOfWeek: 1, roomNumber: 10)
        
    ]
}

