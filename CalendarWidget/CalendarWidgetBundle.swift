//
//  CalendarWidgetBundle.swift
//  CalendarWidget
//
//  Created by Oliver Park on 8/4/24.
//

import WidgetKit
import SwiftUI

@main
struct CalendarWidgetBundle: WidgetBundle {
    var body: some Widget {
        CalendarWidget()
        CalendarWidgetLiveActivity()
    }
}
