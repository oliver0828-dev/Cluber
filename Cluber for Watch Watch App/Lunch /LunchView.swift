//
//  LunchView.swift
//  Cluber
//
//  Created by Oliver Park on 4/23/24.
//

import SwiftUI


struct LunchView: View {
    @State var TodayDate = Date.now
    @State var tomorrow = Date.now.addingTimeInterval(86400)
    @State var isTomorrow = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
    
                
            }
        }
    }
}

#Preview {
    LunchView()
}
