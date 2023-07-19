//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by realxnesia on 19/07/23.
//

import SwiftUI

struct SettingsLabelView: View {
  var labelText: String
  var labelImage: String
  
  var body: some View {
    HStack {
      Text(labelText.uppercased())
        .fontWeight(.black)
      Spacer()
      Image(systemName: labelImage)
    }
  }
}

struct SettingsLabelView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
