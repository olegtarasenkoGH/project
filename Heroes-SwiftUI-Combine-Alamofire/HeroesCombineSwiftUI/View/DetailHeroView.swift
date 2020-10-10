//
//  DetailHeroView.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 9/13/20.
//

import SwiftUI
import Combine
import  URLImage

struct DetailHeroView: View {
    var id: Int?
    
    @ObservedObject var viewModel = DetailHeroViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.hero?.name ?? "")
                .font(.title)
            Text(viewModel.hero?.biography.alterEgos ?? "")
                .font(.title)
            Image(url: viewModel.hero?.images?.medium ?? "")
        }.onAppear {
            self.viewModel.getHero(id: self.id ?? 0)
        }
        
    }
}

   struct Image: View {
       var url: String?

       var body: some View {
           guard let u = URL(string: url ?? "") else {
               return AnyView(Text("Loading..."))
           }
           return AnyView(URLImage(u))
       }
   }


struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
