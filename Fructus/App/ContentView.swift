//
//  ContentView.swift
//  Fructus
//
//  Created by realxnesia on 10/05/23.
//

import SwiftUI

struct ContentView: View {
  @State private var isShowingSettings: Bool = false
  
  var fruits: [Fruit] = fruitsData
  
  var body: some View {
    NavigationView {
      List {
        ForEach(fruits.shuffled()) { fruit in
          NavigationLink(destination: FruitDetailView(fruit: fruit)) { // #ini link ke detail
            FruitRowView(fruit: fruit) // #ini menampilkan list
              .padding(.vertical, 4)
          }
        }
      }
      .navigationTitle("Fruits")
      .toolbar { // TopBar
        Button(
          action: {
            isShowingSettings = true
          },
          label: {
            Image(systemName: "slider.horizontal.3")
          }
        ) //: BUTTON
        .sheet(isPresented: $isShowingSettings) { // penggunaan ($) untuk mendapatkan currentValue
          SettingsView()
        }
      }
    }
    .navigationViewStyle(StackNavigationViewStyle()) // untuk handle behaviour view dari iPadOS
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iPhone 11 Pro")
  }
}
