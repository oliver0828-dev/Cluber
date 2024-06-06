//
//  AccountFramework.swift
//  Cluber
//
//  Created by Oliver Park on 3/13/24.
//

import Foundation
import SwiftUI
import SwiftData

struct Account: Identifiable{
    var id = UUID()
    let name: String
    let accountImage: String
    let insitution: String
    let grade: Int
}

class AccountList: ObservableObject{
    @Published var accounts: [Account]
    
    static let example = Account(name: "Tommy Jang", accountImage: "timCook", insitution: "Daegu International School", grade: 11)
    
    init(){
        accounts = [AccountList.example]
    }
    
    func addNewAccount(name: String, image: String, institution: String, grade: Int){
        let newAccount = Account(name: name, accountImage: image, insitution: institution, grade: grade)
        accounts.append(newAccount)
    }
}

func gradeHightlight(Highlight: Int) -> Color{
    if(Highlight == 8){
        return Color.yellow
    }else if(Highlight == 9){
        return Color.blue
    }else if(Highlight == 10){
        return Color.orange
    }else if(Highlight == 11){
        return Color.green
    }else{
        return Color.indigo
    }
}

func textColor(grade: Int) -> Color{
     if(grade == 9 || grade == 12){
        return Color.white
    }else{
        return Color.black
    }
    
}
