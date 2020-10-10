//
//  DetailHeroView.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 9/14/20.
//

import SwiftUI
import Combine
import  URLImage


struct HeroDetailView: View {
    var id: Int?
    @ObservedObject var heroesViewModel: HeroesViewModel
    
    var body: some View {
        ZStack {
            Color.darkPurple
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(heroesViewModel.selectedHero?.name ?? "")
                            .font(.system(size: 14, weight: .semibold))
                        Text(heroesViewModel.selectedHero?.slug ?? "")
                            .font(.system(size: 16, weight: .bold))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        heroesViewModel.selectedHero = nil
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 32, weight: .light))
                            .padding()
                    })
                }
                
                Text(heroesViewModel.selectedHero?.slug ?? "")
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
        }
        .onAppear {
            self.heroesViewModel.getHero(id: self.id ?? 0)
        }
    }
}


//   struct ImageView: View {
//       var url: String?
//
//
//       var body: some View {
//           guard let urlImage = URL(string: url ?? "") else {
//               return AnyView(Text("Loading..."))
//           }
//           return AnyView(URLImage(urlImage))
//       }
//   }

