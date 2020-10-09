//
//  ContentView.swift
//  PublicTaskListSwiftUICoreData
//
//  Created by Олег Тарасенко on 10/6/20.
//

import SwiftUI
import CoreData

struct ContentView: View{
    
    init() { UITextView.appearance().backgroundColor = .init(cgColor: #colorLiteral(red: 0.9651769996, green: 0.9610516429, blue: 0.9683757424, alpha: 1)) }
    
    var body: some View {
        
       Home()
        
    }
}

