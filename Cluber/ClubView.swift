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
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isTapped = false // for Signed Up
    @State private var isTapped2 = false // for Signing Up
    @State private var counter = 0
    
    @Binding var loved: Bool
    @Binding var memberBoolean: Bool
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if ClubImage != "n/a" {
                        Image(ClubImage)
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                            .frame(maxWidth: 380, maxHeight: .infinity)
                    }
                    
                    HStack {
                        VStack (alignment: .leading) {
                            Text(ClubName)
                                .font(.title.bold())
                            
                            Text(ClubSubName)
                                .foregroundStyle(.gray)
                        }
                        .padding()
                        Spacer()
                        VStack{
                            Text(ClubTeacher)
                                .font(.title3)
                                .fontWeight(.semibold)
                            
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
                        .padding()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("About \(ClubName):")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text(description)
                           
                        }
                        Spacer()
                    }.padding()
                    
                }
                
                VStack {
                    Button { 
                        counter += 1
                    } label: {
                        Link("Sign Up For This Club", destination: URL(string: "https://docs.google.com/spreadsheets/d/1LkVA2yfSANv72DkeX0DK0NDavRieIv26Tufb8GNxISI/edit#gid=0")!)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .clipShape(Capsule())
                            .padding()
                    }
                    .confettiCannon(counter: $counter, confettis: [.sfSymbol(symbolName: sportsConfetti(sports: sports)), .shape(.roundedCross)], colors: [.purple, .orange], confettiSize: 40.0, radius: 400.0)
                    
                    
                    if ClubImage == "n/a" {
                        VStack {
                            Text("Do You Have an Image for this club?")
                            Text("Help us by uploading the photo")
                            Button {
                                
                            } label: {
                                Image(systemName: "photo.badge.plus.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                
                            }
                        }
                    }
                }
            }
            .toolbar {
                if quarter != "All" {
                    Text(quarter + " Only")
                        .fontWeight(.semibold)

                        .foregroundStyle(quarterColor(q: quarter))
                }
                HStack {
                    Button {
                        loved.toggle()
                        counter += 1
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    } label: {
                        if loved == true {
                            Text("Interested")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.pink)
                   
                            Image(systemName: "heart.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.pink)
                          
                            
                        } else {
                            Text("Interested")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                          
                            
                            Image(systemName: "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height:15)
                                .foregroundStyle(.black)
                        }
                    }
                }
                .frame(width: 130, height: 30)
                .background(.gray.opacity(0.5))
                .clipShape(.rect(cornerRadius:15))
                
              
            }
        }.frame(width: 350)
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
    ClubView(ClubName: "Key Club", ClubTeacher: "Mrs. Jolly", ClubImage: "CSCC", description: "Key Club", roomNumber: 0, location: "Conference Room 2", socialMedia: true, instagramLink: "instagram.com", instagramID: "@key_club", quarter: "Q3", loved: .constant(false), memberBoolean: .constant(false))
        .environmentObject(UsernameGradeClass())
}
