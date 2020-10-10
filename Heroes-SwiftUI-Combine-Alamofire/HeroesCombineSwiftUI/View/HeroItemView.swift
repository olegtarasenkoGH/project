//
//  HeroItemView.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 10/10/20.
//

import SwiftUI

struct HeroItemView: View {  //struct MailItemView: View
    let hero: Hero //MailItem
    var body: some View {
        ZStack {
            Color.lightPurple
                .cornerRadius(15)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(hero.name)
                        .font(.system(size: 14, weight: .semibold))
                    Text(hero.biography.alterEgos)
                        .font(.system(size: 16, weight: .bold))
                    Text(hero.slug)
                        .font(.system(size: 14, weight: .regular))
                        .lineLimit(2)
                }
                
                Spacer()
                
                Text(hero.biography.fullName)
                    .font(.system(size: 12, weight: .regular))
            }
            .padding()
            .foregroundColor(hero.isRead ? Color(white: 0.85) : .white)
        }
        .offset(x: hero.offsetX)
    }
}

