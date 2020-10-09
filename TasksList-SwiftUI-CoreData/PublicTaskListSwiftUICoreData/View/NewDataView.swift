//
//  NewDataView.swift
//  PublicTaskListSwiftUICoreData
//
//  Created by Олег Тарасенко on 10/6/20.
//

import SwiftUI

struct NewDataView: View {
    @ObservedObject var homeData: HomeViewModel
    @Environment (\.managedObjectContext) var context
    var body: some View {
        
        VStack{
            
            HStack {
                
                Text( homeData.updateItem == nil ? "Add New" : "Update")
                    .font(.system(size: 42))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                    Spacer(minLength: 0)
            }
            .padding()
            
            TextEditor(text: $homeData.content)
                .cornerRadius(30.0, antialiased: true)
                .padding()
            
            Divider()
                .padding(.horizontal)
            
            HStack {
                
                Text("Выбери день")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
            }
            
            .padding()
            
            HStack (spacing: 10) {
                
                DateButtonView(homeData: homeData, title: "Сегодня")
                DateButtonView(homeData: homeData, title: "  Завтра  ")
                
                // DataPicker
                
             DatePicker("", selection: $homeData.date, displayedComponents: .date )
                    
                    .labelsHidden()
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
            .padding()
            
            // Add button
            Button(action: {homeData.writeData(context: context)}, label: {
                Label(
                    title: {  Text( homeData.updateItem == nil ? "Add New" : " Update")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .blur(radius: 0.2)
                    },
                    
                    icon: { Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                        .blur(radius: 0.2)
                    })
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .background(
                        
                        LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)) ]),
                                       startPoint: .leading, endPoint: .trailing))
                    
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 0.7382145314)).opacity(0.5), radius: 20, x: 0, y: 10)
            
          })
          .padding()
            
            //Disable buttton if no data
            .disabled(homeData.content == "" ? true : false)
            .opacity(homeData.content == "" ? 0.5 : 1)
                
        }
      
        .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.06).ignoresSafeArea(.all, edges: .bottom))
        
    }
}