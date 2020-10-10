//
//  DetailHeroVM.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 9/14/20.
//

import Foundation
import Combine
import Alamofire


class DetailHeroViewModel: ObservableObject {

    @Published var hero: Hero?
    var cancellation: AnyCancellable?
    let service = HeroesService()
   
    func getHero(id: Int) {
        cancellation = service.get(id: id)
       .mapError({ (error) -> Error in
           print(error)
           return error
       })
       .sink(receiveCompletion: { _ in },
             receiveValue: { hero in
               self.hero = hero
       })
   }
}
