import SwiftUI
import Combine
import Foundation


struct HomeView: View {
    @EnvironmentObject var usernameGrade: UsernameGradeClass
    @State private var date = Date.now
    let username: String
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(getGreeting() + username)
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(width: 320, height: 40)
                            .background(CircleColor(gradeLevel: usernameGrade.schoolGrade))
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                    }
                    .padding()
                    
                    DatePicker("Calendar", selection: $date, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding()
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 350, height: 200)
                    }
                    
                    Spacer()
                }
                .navigationTitle("Cluber")
            }
        }
    }
    
    func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: date)
        switch hour {
        case 5..<12: return "Good Morning, "
        case 12..<18: return "Good Afternoon, "
        default: return "Good Evening, "
        }
    }
}

#Preview {
    HomeView(username: "Oliver")
        .environmentObject(UsernameGradeClass())
}



