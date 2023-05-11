//
//  FruitCardView.swift
//  Fructus
//
//  Created by realxnesia on 10/05/23.
//

import SwiftUI

struct FruitCardView: View {
    var fruit: Fruit
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // TODO: Fruit Image
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow( // add semi transparan black shadow
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.15),
                        radius: 8, x: 6, y: 8
                    )
                //animation zoom in
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                // TODO: Fruit Title
                Text(fruit.title)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.15),
                        radius: 2, x: 2, y: 2
                    )
                
                // TODO: Fruit Headline
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .frame(maxWidth: 480)
                
                // TODO: Button Start
                StartButtonView()
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center) //fullffill backgroun to the full entire screen
        .background(
            LinearGradient(
                gradient: Gradient(colors: fruit.gradientColors),
                startPoint: .top, endPoint: .bottom
            )
        )
        .cornerRadius(20)
        .padding(.horizontal, 20)
//        .padding(.vertical, 64)
    }
}

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[1])
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
