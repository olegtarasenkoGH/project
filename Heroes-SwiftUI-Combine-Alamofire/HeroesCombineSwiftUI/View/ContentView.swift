//
//  ContentView.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 9/10/20. ///GIT HUB
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = HeroesViewModel()
    var body: some View {
       
        ZStack {
            
            Color.darkPurple
                      
           
            HeroListView(viewModel: viewModel)
                
        }
        
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
