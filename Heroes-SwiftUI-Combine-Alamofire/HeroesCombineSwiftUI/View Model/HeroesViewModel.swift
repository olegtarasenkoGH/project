//
//  HeroesVM.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 9/10/20.
//

import SwiftUI
import Combine
import Alamofire

class HeroesViewModel: ObservableObject {
    @Published var heroes: [Hero] = []
    @Published var heroDetail: Hero?
    @Published var selectedHero: Hero? = nil
    
    var cancel: AnyCancellable?
    let service = HeroesService()
    
    
    init() { fetchHeroes() }
    
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
    
}
