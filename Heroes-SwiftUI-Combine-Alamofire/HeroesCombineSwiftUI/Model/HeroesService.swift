//
//  HeroesService.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 9/13/20.
//

import SwiftUI
import Combine
import Alamofire

class HeroesService {
    let url =  "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/"
    
    func fetchUrl() -> AnyPublisher<[Hero], AFError> {
        let publisher = AF.request(url + "all.json").publishDecodable(type: [Hero].self)
        return publisher.value()
    }
    
    func get(id: Int)  -> AnyPublisher<Hero, AFError> {
          let publisher = AF.request("\(url)id/\(id).json").publishDecodable(type: Hero.self)
          return publisher.value()
      }
    
}
