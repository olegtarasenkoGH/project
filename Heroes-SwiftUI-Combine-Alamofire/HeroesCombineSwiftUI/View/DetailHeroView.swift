//
//  DetailHeroView.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 9/14/20.
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
            ImageView(url: viewModel.hero?.images?.medium ?? "")
        }.onAppear {
            self.viewModel.getHero(id: self.id ?? 0)
        }
        
    }
}

   struct ImageView: View {
       var url: String?

       var body: some View {
           guard let urlImage = URL(string: url ?? "") else {
               return AnyView(Text("Loading..."))
           }
           return AnyView(URLImage(urlImage))
       }
   }


struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
