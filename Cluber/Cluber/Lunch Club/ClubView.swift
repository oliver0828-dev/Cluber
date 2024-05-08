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
    var teacherImage: String
    var body: some View {
        ScrollView {
            ZStack{
                VStack(spacing: 0) {
                    Image(lunchClubImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                    HStack {
                        Image(teacherImage)
                            .resizable()
                            .clipShape(Circle())
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                        
                        VStack(alignment: .leading){
                            Text(lunchClubName)
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Middlee School")
                                .font(.title3)
                                .foregroundStyle(.blue)
                        }
                        .padding()
                    }
                    .offset(x: 0, y: -70)
                }
            }
            .edgesIgnoringSafeArea(.top)
            Spacer()
        }
    }
}

#Preview {
    ClubView(lunchClubName: "Key Club", lunchClubTeacher: "Mrs. Jolly", lunchClubImage: "KeyClub", teacherImage: "MsJolly")
}
