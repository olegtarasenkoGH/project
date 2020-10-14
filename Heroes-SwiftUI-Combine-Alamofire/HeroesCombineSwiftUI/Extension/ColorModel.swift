//
//  ColorModel.swift
//  HeroesCombineSwiftUI
//
//  Created by Олег Тарасенко on 10/10/20.
//

import SwiftUI

extension Color {
    
    static let darkPurple = Color.init(red: 120/255, green: 106/255, blue: 213/255)
    static let extradarkPurple = Color.init(red: 105/255, green: 91/255, blue: 207/255)
    static let lightPurple = Color.init(red: 139/255, green: 124/255, blue: 225/255)
    static let appGreen = Color.init(red: 45/255, green: 188/255, blue: 179/255)
    static let linear = LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]),
                                         startPoint: .bottom, endPoint: .top)
    static let radial = RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4647871256, green: 0.2920034826, blue: 0.8120906353, alpha: 0.7122177556)),Color(#colorLiteral(red: 0.3627917767, green: 0.06483796984, blue: 0.9860315919, alpha: 0.5892670048))]),
                                       center: .center, startRadius: 2, endRadius: 650)

}
