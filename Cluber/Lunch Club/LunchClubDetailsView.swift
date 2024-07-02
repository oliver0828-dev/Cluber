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
        NavigationStack {
            VStack{
                HStack {
                    HStack {
                        Text(lunchClubName)
                            .font(.title)
                            .fontWeight(.semibold)
                        Image(systemName: "checkmark.seal.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    .padding()
                    Spacer()
                }
                
                Text("")
            }
            .navigationTitle("What Is Your Role?")
        }
    }
}

#Preview {
    LunchClubDetailsView(lunchClubName: "Key Club")
}
