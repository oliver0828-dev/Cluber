//
//  CalendarWidgetLiveActivity.swift
//  CalendarWidget
//
//  Created by Oliver Park on 8/4/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct CalendarWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct CalendarWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CalendarWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension CalendarWidgetAttributes {
    fileprivate static var preview: CalendarWidgetAttributes {
        CalendarWidgetAttributes(name: "World")
    }
}

extension CalendarWidgetAttributes.ContentState {
    fileprivate static var smiley: CalendarWidgetAttributes.ContentState {
        CalendarWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: CalendarWidgetAttributes.ContentState {
         CalendarWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: CalendarWidgetAttributes.preview) {
   CalendarWidgetLiveActivity()
} contentStates: {
    CalendarWidgetAttributes.ContentState.smiley
    CalendarWidgetAttributes.ContentState.starEyes
}
