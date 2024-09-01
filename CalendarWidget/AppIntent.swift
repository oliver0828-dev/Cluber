//
//  AppIntent.swift
//  CalendarWidget
//
//  Created by Oliver Park on 8/4/24.
//

import WidgetKit
import AppIntents
import SwiftUI
import Combine

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")
    

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}



