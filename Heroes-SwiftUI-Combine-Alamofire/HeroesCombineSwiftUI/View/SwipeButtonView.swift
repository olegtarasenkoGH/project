//
//  SwipeView.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 10/10/20.
//

import SwiftUI

struct SwipeButtonView: View {
    @ObservedObject var heroesViewModel = HeroesViewModel()
    let hero: Hero
    
    var body: some View {
      
        ZStack {
            HStack {
                Button(action: {
                    heroesViewModel.markRead(hero: hero)
                }, label: {
                    // wave shave view
                    ReadButtonView(hero: hero)
                })
                
                Spacer()
            }
            
            HStack {
                Spacer()
                Button(action: {
                    withAnimation(.linear) {
                        heroesViewModel.deleteHero(hero: hero)
                    }
                }, label: {
                    // wave shave view
                    DeleteButtonView(hero: hero)
                })
            }
        }
    }
}

struct ReadButtonView: View {
    let hero: Hero
    var body: some View {
        ZStack {
            WaveShape(waveWidth: hero.offsetX, isLeft: true)
                .fill(Color.appGreen)
                .frame(width: 60)
            Image(systemName: "checkmark")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .opacity(hero.offsetX > 50 ? 1.0 : 0.0)
        }
    }
}

struct DeleteButtonView: View {
    let mail: MailItem
    var body: some View {
        ZStack {
            WaveShape(waveWidth: mail.offsetX, isLeft: false)
                .fill(Color.red)
                .frame(width: 60)
            Image(systemName: "xmark")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .opacity(mail.offsetX < -50 ? 1.0 : 0.0)
        }
        
        
    }
}


//swipe view
struct SwipeButtonView: View {
    @ObservedObject var manager: MailManager
    let mail: MailItem
    var body: some View {
      
    }
}
