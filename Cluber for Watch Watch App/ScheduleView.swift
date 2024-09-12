//
//  ScheduleView.swift
//  Cluber for Watch Watch App
//
//  Created by Oliver Park on 9/1/24.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Text("Mon")
                        .foregroundStyle(.blue)
                    Text ("KISBC")
                        .fontWeight(.medium)
                    VStack {
                        Text("Mr. Crewe")
                        Text("304")
                    }
                    
            
                    
                }
            }
            .padding()

        }
    }
}

#Preview {
    ScheduleView()
}
