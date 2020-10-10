//
//  HeroListView.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 10/10/20.
//

import SwiftUI

struct HeroListView: View {
    @ObservedObject var heroesViewModel = HeroesViewModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(heroesViewModel.heroes) { hero in
                ZStack {
                    SwipeButtonView(heroesViewModel: heroesViewModel, hero: hero)
                    
                    HeroItemView(hero: hero)
                        .gesture(
                            DragGesture(minimumDistance: 10)
                                .onChanged({ value in
                                    // handle swipe
                                    if value.translation.width > 0 {
                                        if !hero.isRead {
                                            heroesViewModel.handleReadGesture(hero: hero, swipeWidth: value.translation.width)
                                        }
                                        //lets take it one step further by swipping left to delete the mail
                                    } else if value.translation.width < 0 {
                                        // handle delete gesture
                                        heroesViewModel.handleDeleteGesture(hero: hero, swipeWidth: value.translation.width)
                                    }
                                })
                                .onEnded({ _ in
                                    heroesViewModel.swipeEnded()
                                })
                        )
                        .onTapGesture {
                            heroesViewModel.fetchHeroes()
                            heroesViewModel.selectedHero = hero
                        }
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

// mail list view with LazyVStack

