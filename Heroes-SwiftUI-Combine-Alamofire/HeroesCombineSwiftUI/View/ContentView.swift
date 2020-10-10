//
//  ContentView.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 9/10/20.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var heroesViewModel = HeroesViewModel()  /// MailManager
    
    var body: some View {
        
        ZStack {
            if #available(iOS 14.0, *) {
                Color.darkPurple .ignoresSafeArea()  } else { }
            
            
            
            
//                   MailListView(manager: manager)
                   
//                   if manager.selectedMail != nil {
//                       MailDetailView(manager: manager)
                   }
               }
        
}

    
        
//        NavigationView {
//        List(viewModel.heroes) { hero in
//            HStack {
//                VStack(alignment: .leading) {
//                    NavigationLink(destination: DetailHeroView(id: hero.id)) {
//                    Text(hero.name).font(.headline)
//                    Text(hero.slug).font(.headline)
//                }
//                }
//            }
//        }
//    }
//        .navigationBarTitle("Navigation", displayMode: .inline)
//    }
//}











// 1 colors

extension Color {
    static let darkPurple = Color.init(red: 120/255, green: 106/255, blue: 213/255)
    static let extradarkPurple = Color.init(red: 105/255, green: 91/255, blue: 207/255)
    static let lightPurple = Color.init(red: 139/255, green: 124/255, blue: 225/255)
    static let appGreen = Color.init(red: 45/255, green: 188/255, blue: 179/255)
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

