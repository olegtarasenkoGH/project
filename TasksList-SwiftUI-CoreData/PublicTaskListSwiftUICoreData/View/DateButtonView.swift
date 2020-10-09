//
//  DataButtonView.swift
//  PublicTaskListSwiftUICoreData
//
//  Created by Олег Тарасенко on 10/7/20.
//

import SwiftUI

struct DateButtonView: View {
    
    @ObservedObject  var homeData: HomeViewModel
    
    var title: String
    
    var body: some View {
       
        //View Button
        Button(action: {homeData.updateDate(value: title)}, label: {
            
            Text(title)
                
                .fontWeight(.bold)
                .foregroundColor(homeData.checkDate() == title ? .white : .gray)
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                
                .background(homeData.checkDate() == title ?
                                LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.592707932, green: 0.3724035025, blue: 1, alpha: 0.7975856766)),Color(#colorLiteral(red: 0.4867015481, green: 0.3057770729, blue: 0.8503928781, alpha: 1))]), startPoint: .leading, endPoint: .trailing)
                                : LinearGradient(gradient: Gradient(colors:[ Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),Color(#colorLiteral(red: 0.877861321, green: 0.8808293939, blue: 0.8879383206, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.2), radius: 10, x: 0, y: 10)
        })
        
    }
}
