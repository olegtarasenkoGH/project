//
//  HeroModel.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 9/10/20.
//

import SwiftUI
import Combine
import Alamofire

struct Hero: Codable, Identifiable {
    let id: Int
    let name: String
    let biography: Biography
    let images: Images?
      
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case biography
        case images
    
    }
    
}

struct Biography: Codable {
    let fullName: String
    let alterEgos: String
    
}

struct Images: Codable {
    
    let large: String
    let medium: String
    let small: String
    let extraSmall: String
    
    enum CodingKeys: String, CodingKey {
        
        case extraSmall = "xs"
        case small = "sm"
        case medium = "md"
        case large = "lg"
    }
}
