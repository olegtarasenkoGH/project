//
//  BlurModel.swift
//  PublicTaskListSwiftUICoreData
//
//  Created by Олег Тарасенко on 10/8/20.
//

import SwiftUI



struct BlurModel : UIViewRepresentable {

    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView:  UIVisualEffectView , context: Context)  {
    }

}
