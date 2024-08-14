//
//  LunchClubDetailsView.swift
//  Cluber
//
//  Created by Oliver Park on 6/21/24.
//

import SwiftUI

struct LunchClubDetailsView: View {
    @State var lunchClubName: String
    
    var body: some View {
            VStack{
                HStack {
                    HStack {
                        Text(lunchClubName)
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    Spacer()
                }
                
                Text("")
            }
            .navigationTitle("What Is Your Role?")
    }
}

#Preview {
    LunchClubDetailsView(lunchClubName: "Key Club")
}
