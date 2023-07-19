//
//  SettingsView.swift
//  Fructus
//
//  Created by realxnesia on 19/07/23.
//

import SwiftUI

struct SettingsView: View {
  @Environment(\.presentationMode) var presentationMode // env properti memudahkan kita untuk membuat properti dan menyimpan value
  
    var body: some View {
      NavigationView {
        ScrollView(.vertical, showsIndicators: false) {
          VStack {
            // MARK: - SECTION 1
            GroupBox(
              content: {
                Divider().padding(.vertical, 4) // separator
                HStack(alignment: .center, spacing: 10) {
                  Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(9)
                  
                  Text("Most fruits are naturally low in fat, sodium, and calories. None have cholestrol. Fruits are sources of many essentials nutrients, including potassium, dietary fiber, vitamins, and much more.")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                }
                
              }, label: {
                SettingsLabelView(
                  labelText: "Fructus2",
                  labelImage: "info.circle"
                )
              }
            )
            // MARK: - SECTION 2
            // MARK: - SECTION 3
          } //: VSTACK
          .navigationTitle("Settings")
          .navigationBarTitleDisplayMode(.large)
          .navigationBarItems(
            trailing: Button(
              action: {
                presentationMode.wrappedValue.dismiss()
              },
              label: {
                Image(systemName: "xmark")
              }
            )
          )
          .padding()
        } //: SCROLL
      } //: NAVIGATION
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 11 Pro")
    }
}
