//
//  DetailHeroView.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 9/14/20.
//

import SwiftUI
import  URLImage

struct HeroDetailView: View {
    
    @ObservedObject var viewModel: HeroesViewModel
    var body: some View {
        ZStack(alignment: .center) {
            Color.radial
                          
            VStack(alignment: .center, spacing: 20) {
                
                HStack {
                    
                    VStack(alignment: .center, spacing: 5) {
                        
                        Text(viewModel.selectedHero?.name ?? "")
                            .font(.system(size: 34, weight: .bold))
                        
                        Text(viewModel.selectedHero?.biography.alterEgos ?? "")
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                        
                        ImageView(url: viewModel.selectedHero?.images?.medium ?? "")
                            .clipShape(RoundedRectangle(cornerRadius: 70, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).opacity(0.7), radius: 20, x: 0, y: 0)

                    }
                }
                
                Text(viewModel.selectedHero?.name ?? "")
                    .font(.system(size: 16, weight: .regular))
                Text(viewModel.selectedHero?.biography.fullName ?? "")
                    .font(.system(size: 16, weight: .bold))
            
            }
            .padding()
            .foregroundColor(.white)
        }
        //        .onAppear {
        //
        //          viewModel.markRead(hero: viewModel.selectedHero!)
        //        }
        
        
        .edgesIgnoringSafeArea(.all)
        
    }
}

