//
//  SettingsView.swift
//  Fructus
//
//  Created by realxnesia on 19/07/23.
//

import SwiftUI

struct SettingsView: View {
  @Environment(\.presentationMode) var presentationMode // env properti memudahkan kita untuk membuat properti dan menyimpan value
  @AppStorage("isOnboarding") var isOnboarding: Bool = false
  
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
            // MARK: - SECTION 2: Toogle Customization
            GroupBox(
              content: {
                Divider().padding(.vertical, 4)
                
                Text("If you wish, you can restart the application by toogle the switch in this box. That way it starts the onboarding process and you will see the wellcome screen again.")
                  .padding(.vertical, 8)
                  .frame(minHeight: 30)
                  .layoutPriority(1)
                  .font(.footnote)
                  .multilineTextAlignment(.leading)
                
                Toggle(isOn: $isOnboarding) {
                  if isOnboarding {
                    Text("Restarted")
                      .fontWeight(.bold)
                      .foregroundColor(.green)
                  } else {
                    Text("Restart".uppercased())
                      .fontWeight(.bold)
                      .foregroundColor(.secondary)
                  }
                }
                .padding()
                .background(
                  Color(UIColor.tertiarySystemBackground)
                    .clipShape(
                      RoundedRectangle(
                        cornerRadius: 8,
                        style: .continuous
                      )
                    )
                )
              },
              label: {
                SettingsLabelView(
                  labelText: "Customization",
                  labelImage: "paintbrush"
                )
              }
            )
            
            // MARK: - SECTION 3
            GroupBox(
              content: {
                SettingsRowView(key: "Developer", value: "Dhika Aditya")
                SettingsRowView(key: "Designer", value: "Robert Petras")
                SettingsRowView(key: "Compatibility", value: "iOS 14")
                SettingsRowView(
                  key: "Website",
                  valueLinkTitle: "SwiftUI MasterClass",
                  valueLinkContent: "swiftuimasterclass.com"
                )
                SettingsRowView(
                  key: "Twitter",
                  valueLinkTitle: "@google.com",
                  valueLinkContent: "google.com"
                )
                SettingsRowView(key: "SwiftUI", value: "2.0")
                SettingsRowView(key: "Version", value: "1.1.0")
              }, label: {
                SettingsLabelView(
                  labelText: "Application",
                  labelImage: "app.iphone"
                )
              }
            )
            
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
