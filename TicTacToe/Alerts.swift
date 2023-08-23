//
//  Alerts.swift
//  VisionTrapped
//
//  Created by 村田興児 on 2023/07/01.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
    
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You win!"), message: Text("You're so smart!"), buttonTitle: Text("Yeah!"))
    static let computerWin = AlertItem(title: Text("You lost!"), message: Text("Try again...!"), buttonTitle: Text("Yeah..."))
    static let draw = AlertItem(title: Text("Draw"), message: Text("What a battle..."), buttonTitle: Text("Try again..."))
}
