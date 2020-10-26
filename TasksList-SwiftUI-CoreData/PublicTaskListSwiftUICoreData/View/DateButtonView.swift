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
                .background(homeData.checkDate() == title ? Color.linearOn  :  Color.linearOff )
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.2), radius: 10, x: 0, y: 10)
            
        })
        
    }
}
