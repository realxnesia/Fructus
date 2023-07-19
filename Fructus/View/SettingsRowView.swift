//
//  SettingsRowView.swift
//  Fructus
//
//  Created by realxnesia on 19/07/23.
//

import SwiftUI

struct SettingsRowView: View {
  var key: String
  var value: String? = nil
  var valueLinkTitle: String? = nil
  var valueLinkContent: String? = nil
  
  var body: some View {
    VStack {
      Divider().padding(.vertical, 4)
      HStack {
        Text(key)
          .foregroundColor(.gray)
        Spacer()
        if (value != nil) {
          Text(value!)
        } else if (valueLinkTitle != nil && valueLinkContent != nil) {
          if let valueLinkTitle, let valueLinkContent {
            Link(valueLinkTitle ?? "", destination: URL(string: "https://\(valueLinkContent)")!)
            Image(systemName: "arrow.up.right.square")
              .foregroundColor(.pink)
          }
        } else {
          EmptyView()
        }
      }
    }
  }
}

struct SettingsRowView_Previews: PreviewProvider {
  static var previews: some View {
      SettingsRowView(key: "Developer", value: "Dhika Aditya AP")
        .previewLayout(
          .fixed(width: 375, height: 60)
        )
        .padding()
  }
}
