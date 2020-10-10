//
//  HeroesVM.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 9/10/20.
//

import SwiftUI
import Combine
import Alamofire


class HeroesViewModel: ObservableObject { // Mailmanager
    @Published var heroes: [Hero] = []   //mails
    
    
    @Published var selectedHero: Hero? = nil
    var changingHeroIndex = -1
    var isChanging = false
    
    var cancel: AnyCancellable?
    let service = HeroesService()
    
    
    func markRead(hero: Hero) {
        if let index = heroes.firstIndex(where: { $0.id == hero.id }) {
            withAnimation(.linear) {
                heroes[index].isRead = true
                heroes[index].offsetX = 0.0
            }
        }
    }
    
    func handleReadGesture(hero: Hero, swipeWidth: CGFloat) {
        if swipeWidth != 0 {
            if let index = heroes.firstIndex(where: { $0.id == hero.id }) {
                withAnimation(.linear) {
                    swipeStarted(index: index)
                    
                    if swipeWidth <= 120 {
                        heroes[index].offsetX = swipeWidth/2
                    }
                    
                    if swipeWidth > 120 {
                        heroes[index].offsetX = 60
                    }
                    
                    if swipeWidth > 240 {
                        markRead(hero: hero)
                    }
                }
                
            }
        }
    }
    
    func handleDeleteGesture(hero: Hero, swipeWidth: CGFloat) {
        if swipeWidth != 0 {
            if let index = heroes.firstIndex(where: { $0.id == hero.id }) {
                withAnimation(.linear) {
                    swipeStarted(index: index)
                    
                    if swipeWidth >= -120 {
                        heroes[index].offsetX = swipeWidth/2
                    }
                    
                    if swipeWidth < -120 {
                        heroes[index].offsetX = -60
                    }
                    
                    if swipeWidth < -240 {
                        //delete mail
                        deleteHeroIndex(index: index)
                    }
                }
                
            }
        }
    }

    func deleteHeroIndex(index: Int) {
        if index == changingHeroIndex {
            changingHeroIndex = -1
        }
        heroes.remove(at: index)
    }
    
    func deleteHero(hero: Hero) {
        if let index = heroes.firstIndex(where: { $0.id == hero.id }) {
            if index ==  changingHeroIndex {
                changingHeroIndex = -1
            }
            heroes.remove(at: index)
        }
    }
    
    func swipeStarted(index: Int) {
        if (changingHeroIndex != -1 && !isChanging) {
            heroes[changingHeroIndex].offsetX = 0.0
            isChanging = true
        }
        changingHeroIndex = index
    }
    
    func swipeEnded() {
        isChanging = false
        
        let readStart: CGFloat = 55.0
        let readEnd: CGFloat = 60.0
        let markReadRange = readStart...readEnd
        
        let deleteStart: CGFloat = -60.0
        let delteEnd: CGFloat = -55.0
        let markDeleteRange = deleteStart...delteEnd
        
        if (changingHeroIndex != -1) {
            if !markReadRange.contains(heroes[changingHeroIndex].offsetX) && !markDeleteRange.contains(heroes[changingHeroIndex].offsetX) {
                withAnimation(.linear) {
                   heroes[changingHeroIndex].offsetX = 0.0
                }
            }
        }
    }
    
    
    func fetchHeroes() {
        cancel = service.fetchUrl()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            
            .sink(receiveCompletion: { _ in }, receiveValue: { heroes in
                self.heroes = heroes
            })
    }
    
    init() { fetchHeroes() }
    
    
}


