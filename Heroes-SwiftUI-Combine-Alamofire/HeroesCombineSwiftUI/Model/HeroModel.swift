//
//  HeroModel.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 9/10/20.
//

import SwiftUI

struct Hero: Codable, Identifiable {    //MailItem
 
    let id: Int
    let name: String
    let slug: String
    let biography: Biography
    let images: Images?
    var offsetX: CGFloat = 0.0
    var isRead = false
    
    
    enum CodingKeys: String, CodingKey {
      
        case id
        case name
        case slug
        case biography
        case images
        
    }
}

struct Biography: Codable {

    let fullName: String
    let alterEgos: String

}

///Hero
//// mail model class
//struct MailItem: Identifiable {
//    let id = UUID()
//    let senderName: String
//    let sendTime: String
//    let title: String
//    let message: String
//    var offsetX: CGFloat = 0.0
//    var isRead = false
//}

struct Images: Codable {
    let medium: String
    let large: String
    
    enum CodingKeys: String, CodingKey {
        case medium = "md"
        case large = "lg"
    }
}
