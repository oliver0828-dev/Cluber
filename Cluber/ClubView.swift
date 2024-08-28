//
//  ClubView.swift
//  Cluber
//
//  Created by Oliver Park on 4/24/24.
//

import SwiftUI
import ConfettiSwiftUI

struct ClubView: View {
    
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    
    var ClubName: String = "Club"
    var ClubTeacher: String
    var ClubImage: String
    var ClubSubName: String = ""
    var description: String
    var schoolLevel: String = "High"
    var roomNumber: Int
    var location: String = ""
    var socialMedia: Bool = false
    var instagramLink: String = ""
    var instagramID: String = " "
    var quarter: String = "All"
    var sports: String = "N"
    var aiGenerated: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isTapped = false // for Signed Up
    @State private var isTapped2 = false // for Signing Up
    @State private var counter = 0
    @State private var showAlert = false
    
    @Binding var loved: Bool
    @Binding var memberBoolean: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        if ClubImage != "n/a" {
                            Image(ClubImage)
                                .resizable()
                                .scaledToFit()
                                .clipShape(.rect(cornerRadius: 10))
                                .frame(maxWidth: 380, maxHeight: 250)
                        }
                        HStack {
                            VStack (alignment: .leading) {
                                Text(ClubName)
                                    .font(.title.bold())
                                
                                Text(ClubSubName)
                                    .foregroundStyle(.gray)
                            }
                        
                            Spacer()
                            VStack{
                                HStack {
                                    Image(systemName: "person.bust.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 20)
                                    Text(ClubTeacher)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                }
                                
                                if roomNumber != 0 {
                                    HStack {
                                        Image(systemName: "door.right.hand.open")
                                        Text("\(roomNumber)")
                                    }
                                    
                                } else {
                                    HStack {
                                        Image(systemName: "location.fill")
                                        Text(location)
                                            .font(.callout)
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        Divider()
                        
                        
                        if socialMedia == true {
                            HStack {
                                Text("Social Media:")
                                    .fontWeight(.semibold)
                                Button {
                                    print("Clicked")
                                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                } label: {
                                    Link(destination: URL(string: instagramLink) ?? URL(string: "https://instagram.com")!) {
                                        Image("instagram")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                        Text(instagramID)
                                        
                                    }
                                    
                                }
                                Spacer()
                            }
                         
                        }
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("About \(ClubName):")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text(description)
                                    .confettiCannon(counter: $counter, confettis: [.sfSymbol(symbolName: sportsConfetti(sports: sports)), .shape(.roundedCross)], colors: [Color.blue, Color.green], confettiSize: 40.0, radius: 400.0)
                                
                                if aiGenerated {
                                    
                                    HStack {
                                        Spacer()
                                        Image(systemName: "doc.append")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 15, height: 15)
                                        Text("AI Generated Description")
                                            .font(.callout)
                                        Spacer()
                                    }.foregroundStyle(.gray)
                                    
                                }
                                
                            }
                            Spacer()
                        }
                        
                    }
                }
                Spacer()
                    .toolbar {
                        if quarter != "All" {
                            Text(quarter + " Only")
                                .fontWeight(.semibold)
                                .foregroundStyle(quarterColor(q: quarter))
                        }
                        
                        HStack {
                            Button {
                                loved.toggle()
                                if loved {
                                    counter += 1
                                }
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            } label: {
                                if loved == true {
                                    Text("Member")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.blue)
                                        .fontDesign(.rounded)
                                    
                                    Image(systemName: "person.crop.square.filled.and.at.rectangle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                        .foregroundStyle(.blue)
                                    
                                    
                                } else {
                                    Text("Enroll")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                        .fontDesign(.rounded)
                                    
                                    
                                    Image(systemName: "person.crop.square.filled.and.at.rectangle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height:15)
                                        .foregroundStyle(.black)
                                }
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Already Signed Up"),
                                    message: Text("You have already signed up for \(ClubName), so you cannot sign up for this club again."),
                                    dismissButton: .default(Text("OK"))
                                )
                            }
                        }
                        .frame(width: 130, height: 30)
                        .background(.gray.opacity(0.5))
                        .clipShape(.rect(cornerRadius:15))
                    }
            }
            .fontDesign(.rounded)
        }
        .padding()
    }
    
    private func saveStates() {
        UserDefaults.standard.set(loved, forKey: "\(ClubName)_loved")
        UserDefaults.standard.set(memberBoolean, forKey: "\(ClubName)_member")
    }
    
    private func loadLoveState() -> Bool {
        return UserDefaults.standard.bool(forKey: "\(ClubName)_loved")
    }
    
    private func loadMemberState() -> Bool {
        return UserDefaults.standard.bool(forKey: "\(ClubName)_member")
    }
    
    private func quarterColor(q: String) -> Color {
        if q == "Q1" {
            return .blue
        } else if q == "Q2" {
            return .green
        } else if q == "Q3" {
            return .primary
        }
        return .black
    }
    
    private func sportsConfetti(sports: String) -> String {
        if sports == "futsal" {
            return "soccerball"
        } else if sports == "basketball" {
            return "basketball.fill"
        } else if sports == "volleyball" {
            return "volleyball.fill"
        }
        return "fireworks"
    }
    
}




#Preview {
    ClubView(ClubName: "Key Club", ClubTeacher: "Mrs. Jolly", ClubImage: "CSCC", description: "Key Club", roomNumber: 0, location: "Conference Room 2", socialMedia: true, instagramLink: "instagram.com", instagramID: "@key_club", quarter: "Q3", aiGenerated: true, loved: .constant(false), memberBoolean: .constant(false))
        .environmentObject(UsernameGradeClass())
}
