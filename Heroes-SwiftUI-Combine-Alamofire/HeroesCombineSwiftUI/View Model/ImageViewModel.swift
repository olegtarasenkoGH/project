//
//  ImageView.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 10/13/20.
//

import SwiftUI
import  URLImage

struct ImageView: View {
    var url: String?

    var body: some View {
        guard let urlString = URL(string: url ?? "") else {
            return AnyView(Text("Loading..."))
        }
        return AnyView(URLImage(urlString))
    
}

}
