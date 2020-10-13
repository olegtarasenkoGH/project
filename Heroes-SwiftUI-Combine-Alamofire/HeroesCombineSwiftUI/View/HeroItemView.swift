//
//  HeroItemView.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 10/10/20.
//

import SwiftUI

struct HeroItemView: View {
 
    let hero: Hero
    var body: some View {
        ZStack {
            Color.lightPurple
               
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.2), radius: 15, x: 0, y: 0)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(hero.name )
                        .font(.system(size: 14, weight: .semibold))
                    Text(hero.biography.fullName )
                        .font(.system(size: 16, weight: .bold))
                    Text(hero.biography.alterEgos )
                        .font(.system(size: 14, weight: .regular))
                        .lineLimit(2)
                }
                
                Spacer()
                
            }
            .padding()
            .foregroundColor(.white)
        }
      
    }
}
