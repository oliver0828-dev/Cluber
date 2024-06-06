//
//  AccountView.swift
//  Cluber
//
//  Created by Oliver Park on 3/13/24.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var accountList: AccountList

    var body: some View {
        NavigationStack{
            List(accountList.accounts){ account in
                VStack{
                    Image(account.accountImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 300)
                        .clipShape(Circle())
                    Text(account.name)
                        .font(.title)
                        .fontWeight(.semibold)
                    Text(account.insitution)
                        .font(.title2)
                        .fontWeight(.light)
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .frame(width: 100, height: 20)
                            .foregroundStyle(gradeHightlight(Highlight: account.grade))
                        Text("\(account.grade)th Grade")
                            .foregroundStyle(textColor(grade: account.grade))
                        
                        
                    }
                   
                }
                
            }
         .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
}

