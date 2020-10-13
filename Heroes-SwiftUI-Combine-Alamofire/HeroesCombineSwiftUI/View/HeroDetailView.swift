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
            Color.darkPurple
            
            VStack(alignment: .center, spacing: 20) {
                
                HStack {
                    
                    VStack(alignment: .center, spacing: 8) {
                        
                        Text(viewModel.selectedHero?.name ?? "")
                            .font(.system(size: 34, weight: .bold))
                        
                        Text(viewModel.selectedHero?.biography.alterEgos ?? "")
                            .font(.system(size: 16, weight: .bold))
                        
                        ImageView(url: viewModel.selectedHero?.images?.medium ?? "")
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

