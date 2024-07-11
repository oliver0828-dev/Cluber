//
//  InstagramStories.swift
//  Cluber
//
//  Created by Oliver Park on 7/8/24.
//

import Foundation
import SwiftUI

struct InstagramSharingUtils {

  private static var instagramStoriesUrl: URL? {
    if let url = URL(string: "instagram-stories://share?source_application=your-app-bundle-identifier") {
      if UIApplication.shared.canOpenURL(url) {
        return url
      }
    }
    return nil
  }

  static var canOpenInstagramStories: Bool {
    return instagramStoriesUrl != nil
  }

  static func shareToInstagramStories(_ image: UIImage) {

    guard let instagramStoriesUrl = instagramStoriesUrl else {
      return
    }

    let imageDataOrNil = UIImage.pngData(image)
    guard let imageData = imageDataOrNil() else {
      print("🙈 Image data not available.")
      return
    }
    let pasteboardItem = ["com.instagram.sharedSticker.backgroundImage": imageData]
    let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(60 * 5)]

    UIPasteboard.general.setItems([pasteboardItem], options: pasteboardOptions)

    UIApplication.shared.open(instagramStoriesUrl, options: [:], completionHandler: nil)
  }
}


