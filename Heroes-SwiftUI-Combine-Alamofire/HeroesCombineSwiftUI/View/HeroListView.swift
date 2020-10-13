//
//  HeroListView.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 10/10/20.
//

import SwiftUI
import Combine

struct HeroListView: View {
    @ObservedObject var viewModel: HeroesViewModel
    @State var showingDetail = false
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(viewModel.heroes) { hero in
                ZStack {
                    
                    Button(action: {
                        
                        viewModel.selectedHero = hero
                        self.showingDetail.toggle()
                    } ) {
                        
                        HeroItemView(hero: hero)
                        
                    } .sheet(isPresented: $showingDetail) {
                        HeroDetailView(viewModel: viewModel)
                    }
                    
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

