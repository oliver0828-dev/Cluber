//
//  ClubView.swift
//  Cluber
//
//  Created by Oliver Park on 4/24/24.
//

import SwiftUI

struct ClubView: View {
    
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    
    var lunchClubName: String = "Club"
    var lunchClubTeacher: String
    var lunchClubImage: String
    var lunchClubSubName: String = ""
    var description: String
    var schoolLevel: String = "High"
    var roomNumber: Int
    var location: String = ""
    var socialMedia: Bool = false
    var instagramLink: String = ""
    var instagramID: String = " "
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isTapped = false // for Signed Up
    @State private var isTapped2 = false // for Signing Up
    
    @Binding var loved: Bool
    @Binding var memberBoolean: Bool
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(lunchClubImage)
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 10))
                        .frame(maxWidth: 380, maxHeight: .infinity)
                    
                    HStack {
                        VStack (alignment: .leading) {
                            Text(lunchClubName)
                                .font(.title.bold())
                            
                            Text(lunchClubSubName)
                        }
                        .padding()
                        Spacer()
                        VStack{
                            Text(lunchClubTeacher)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.blue)
                            Text(schoolLevel)
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .frame(width: 120, height: 25)
                                .background(.blue)
                                .clipShape(.capsule)
                            if roomNumber != 0 {
                                HStack {
                                    Image(systemName: "door.right.hand.open")
                                    Text("\(roomNumber)")
                                }
                                .foregroundStyle(.blue)
                            } else {
                                HStack {
                                    Image(systemName: "location.fill")
                                    Text(location)
                                        .font(.callout)
                                }
                                .foregroundStyle(.blue)
                            }
                            
                        }
                        .padding()
                    }
                    Divider()
                    
                    
                    if socialMedia == true {
                        HStack {
                            Text("Social Media:")
                            Button {
                                print("Clicked")
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
                            Text("About \(lunchClubName):")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text(description)
                        }
                        Spacer()
                    }.padding()
                 
                    VStack {
                        if isTapped == false {
                            Button {
                                isTapped2.toggle()
                            } label: {
                                if isTapped2 == false {
                                    Link("Sign Up For This Club", destination: URL(string: "https://docs.google.com/spreadsheets/d/1LkVA2yfSANv72DkeX0DK0NDavRieIv26Tufb8GNxISI/edit#gid=0")!)
                                        .foregroundColor(.white)
                                        .frame(width: 200, height: 50)
                                        .background(Color.blue)
                                        .clipShape(Capsule())
                                        .padding()
                                } else {
                                    VStack {
                                        Image(systemName: "person.crop.circle.fill.badge.checkmark")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                            .frame(width: 50, height: 50)
                                        Text("Joined It! Wait for a review!")
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        Divider()
                            .padding()
                        HStack {
                            Text(isTapped ? "" : "Are You a Member of This Club?")
                            Image(systemName: isTapped ? "" :  "arrow.down")
                        }
                        if isTapped2 == false {
                            Button {
                                print("Signed Up")
                                memberBoolean.toggle()
                                isTapped = memberBoolean
                                usernameGrade.memberBoolean = memberBoolean
                            } label: {
                                if isTapped == false {
                                    Text("Signed Up")
                                        .foregroundStyle(.white)
                                        .frame(width: 120, height: 50)
                                        .background(.green)
                                        .clipShape(.capsule)
                                } else {
                                    VStack {
                                        Image(systemName: "person.fill.checkmark")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                                            .frame(width: 50, height: 50)
                                        Text("You're Already Member of this Club!")
                                            .foregroundStyle(.gray)
                                        Text("Click Again to Cancel")
                                            .font(.caption)
                                            .foregroundStyle(.red)
                                        
                                        NavigationLink("Role", destination: LunchClubDetailsView(lunchClubName: lunchClubName))
                                            .foregroundStyle(.white)
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                            .fontDesign(.rounded)
                                            .frame(width: 120, height: 50)
                                            .background(.blue)
                                            .clipShape(.rect(cornerRadius: 15))
                                    }
                                }
                            }
                        }
                    }
                }
                .toolbar {
                    HStack {
                        Button {
                            loved.toggle()
                            
                        } label: {
                            if loved == true {
                                Text("Interested")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.pink)
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 5, height:5)
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
            }
        }
    }
    private func saveStates() {
        UserDefaults.standard.set(loved, forKey: "\(lunchClubName)_loved")
        UserDefaults.standard.set(memberBoolean, forKey: "\(lunchClubName)_member")
    }
    
    private func loadLoveState() -> Bool {
         return UserDefaults.standard.bool(forKey: "\(lunchClubName)_loved")
    }
    
    private func loadMemberState() -> Bool {
        return UserDefaults.standard.bool(forKey: "\(lunchClubName)_member")
    }
    
}

#Preview {
    ClubView(lunchClubName: "Key Club", lunchClubTeacher: "Mrs. Jolly", lunchClubImage: "MSKeyClub", description: "Key Club", roomNumber: 0, location: "Conference Room 2", socialMedia: true, instagramLink: "instagram.com", instagramID: "@key_club", loved: .constant(false), memberBoolean: .constant(false))
        .environmentObject(UsernameGradeClass())
}
