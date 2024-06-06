//
//  ClubView.swift
//  Cluber
//
//  Created by Oliver Park on 4/24/24.
//

import SwiftUI

struct ClubView: View {
    
    var lunchClubName: String
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
    @State var loved: Bool = false
    
    var body: some View {
        ScrollView {
            HStack {
                HStack {
                    Text("Interested")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Button {
                        loved.toggle()
                        
                    } label: {
                        if loved == true {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height:20)
                                .foregroundStyle(.pink)
                                
                        } else {
                            Image(systemName: "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height:20)
                                .foregroundStyle(.black)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
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
                
                Text(description)
                    .padding()
                Link("Sign Up For This Club", destination: URL(string: "https://docs.google.com/spreadsheets/d/1LkVA2yfSANv72DkeX0DK0NDavRieIv26Tufb8GNxISI/edit#gid=0")!)
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 50)
                    .background(.blue.gradient)
                    .clipShape(.capsule)
                
            }
            

            
        }
    }
}

#Preview {
    ClubView(lunchClubName: "Key Club", lunchClubTeacher: "Mrs. Jolly", lunchClubImage: "MSKeyClub", description: "Key Club", roomNumber: 0, location: "Conference Room 2", socialMedia: true, instagramLink: "instagram.com", instagramID: "@key_club")
}
