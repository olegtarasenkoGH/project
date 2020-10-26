//
//  ColorExtension.swift
//  PublicTaskListSwiftUICoreData
//
//  Created by Олег Тарасенко on 10/26/20.
//

import SwiftUI

extension Color {
    
    static let radial = RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]),
                                       center: .center, startRadius: 2, endRadius: 650)
    
    static let linearOn = LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.592707932, green: 0.3724035025, blue: 1, alpha: 0.7975856766)),Color(#colorLiteral(red: 0.4867015481, green: 0.3057770729, blue: 0.8503928781, alpha: 1))]),
                                         startPoint: .leading, endPoint: .trailing)
    
    static let linearOff = LinearGradient(gradient: Gradient(colors:[ Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),Color(#colorLiteral(red: 0.877861321, green: 0.8808293939, blue: 0.8879383206, alpha: 1))]),
                                          startPoint: .leading, endPoint: .trailing)
    
    static let addUpdate = LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)) ]),
                                            startPoint: .leading, endPoint: .trailing)
    
    
}
