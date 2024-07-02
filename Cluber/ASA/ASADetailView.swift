//
//  ASADetailView.swift
//  Cluber
//
//  Created by Oliver Park on 6/2/24.
//

import SwiftUI

struct ASADetailView: View {
    
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    
    var ASAName: String
    var ASATeacher: String
    var ASAImage: String
    var ASASubName: String = ""
    var description: String
    var schoolLevel: String = "High"
    var roomNumber: Int
    var location: String = ""
    var socialMedia: Bool = false
    var instagramLink: String = ""
    var instagramID: String = " "
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var loved: Bool
    
    var body: some View {
        NavigationStack  {
        ScrollView {
                VStack {
                    Image(ASAImage)
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 10))
                        .frame(maxWidth: 380, maxHeight: .infinity)
                    HStack {
                        VStack (alignment: .leading) {
                            Text(ASAName)
                                .font(.title.bold())
                            
                            Text(ASASubName)
                        }
                        .padding()
                        Spacer()
                        VStack {
                            Text(ASATeacher)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.green.opacity(0.9))
                            Text(schoolLevel)
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .frame(width: 120, height: 25)
                                .background(.green.opacity(0.9))
                                .clipShape(.capsule)
                            HStack {
                                Image(systemName: "door.right.hand.open")
                                Text("\(roomNumber)")
                            }
                            .foregroundStyle(.green.opacity(0.9))
                        }
                        .padding()
                    }
                    
                    Text(description)
                        .padding()
                }
            }
        .toolbar {
            HStack {
                Button {
                    loved.toggle()
                    
                } label: {
                    if loved == true {
                        Text("Interested")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.pink)
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height:20)
                            .foregroundStyle(.pink)
                        
                    } else {
                        Text("Interested")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height:20)
                            .foregroundStyle(.black)
                    }
                }
            }
            .frame(width: 160, height: 35)
            .background(.gray.opacity(0.5))
            .clipShape(.rect(cornerRadius:15))
        }
        }
    }
}

#Preview {
    ASADetailView(ASAName: "Key Club", ASATeacher: "Mrs. Jolly", ASAImage: "MSKeyClub", description: "Coming Soon", roomNumber: 203, loved: .constant(true))
        .environmentObject(UsernameGradeClass())
}
