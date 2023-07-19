//
//  FruitDetailView.swift
//  Fructus
//
//  Created by realxnesia on 12/05/23.
//

import SwiftUI

struct FruitDetailView: View {
    var fruit: Fruit
    
    var body: some View {
      NavigationView {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .center, spacing: 20) {
            // MARK: HEADER
            FruitHeaderView(fruit: fruit)
            
            VStack(alignment: .leading, spacing: 20) {
              // MARK: TITLE
              Text(fruit.title)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(fruit.gradientColors[1])
              
              // MARK: HEADLINE
              Text(fruit.headline)
                .font(.headline)
                .multilineTextAlignment(.leading)
              
              // MARK: NUTRIENTS
              FruitNutrientsView(fruit: fruit)
              
              // MARK: SUBHEADLINE
              Text("Learn more about \(fruit.title)".uppercased())
                .fontWeight(.bold)
                .foregroundColor(fruit.gradientColors[1])
              
              // MARK: DESCRIPTION
              Text(fruit.description)
                .multilineTextAlignment(.leading)
              
              // MARK: LINK
              SourceLinkView()
                .padding(.top, 10)
                .padding(.bottom, 40)
            } //: VStack
            .padding(.horizontal, 20)
            .frame(maxWidth: 640, alignment: .center)
          } //: VStack
        }//: ScrollView
        .edgesIgnoringSafeArea(.top)
      }//: NaviagtionView
    }
}

struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
    }
}
