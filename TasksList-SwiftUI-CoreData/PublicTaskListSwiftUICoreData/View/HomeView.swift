//
//  HomeView.swift
//  PublicTaskListSwiftUICoreData
//
//  Created by Олег Тарасенко on 10/6/20.
//

import SwiftUI
import CoreData

struct Home: View {
    
    @StateObject var homeData = HomeViewModel()
    
    // Fetching Data
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .interactiveSpring()) var results : FetchedResults<Task>
    @Environment(\.managedObjectContext) var context
    
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
          

            VStack(spacing: 0) {
                
                HStack(alignment: .center){
                    
                    Text("Tasks")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        
                    Spacer(minLength: 0)
                }
                
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color(#colorLiteral(red: 0.9607030749, green: 0.9718312621, blue: 0.9789928794, alpha: 1)))
            
             
                
                // Empty View
                if results.isEmpty{
                    Spacer()
                    
                Text("No Task")
                    .font(.title)
                    .fontWeight(.bold)
                    
                    Spacer()
    
                } else {
                    
                    ScrollView (.vertical, showsIndicators: true, content: {
                        
                        LazyVStack(alignment: .leading, spacing: 20){
                            ForEach(results){ task in
                                
                                VStack(alignment: .leading, spacing: 5, content: {
                                            
                                    Text(task.content ?? "")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    
                                    Text(task.date ?? Date(), style: .date)
                                        .fontWeight(.bold)
                                })
                                
                                .foregroundColor(.black)
                                
                               .padding(.vertical, 10)
                                
                              
                              //  .background(Color(#colorLiteral(red: 0.8425681591, green: 0.838967979, blue: 0.8453604579, alpha: 0.5)))
                               // .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                             //   .frame(width: UIScreen.main.bounds.width - 30)
                              //.background(BlurModel(style: .regular))
                                
                                .contextMenu{
                                    
                                    Button(action: {homeData.editItem(item: task)}, label: {
                                        Text("Edit")
                                    })
                                    
                                    Button(action: {
                                        context.delete(task)
                                        try! context.save()
                                        
                                    }, label: {
                                        Text("Delete")
                                    })
                                    
                                }
                                
                            }
                        }
                        .padding()
                    })
                
                }
                   
            }

        // Add button
        Button(action: {homeData.newData.toggle()}, label: {
            Text("NEW TASK")

                .fontWeight(.bold)
                .foregroundColor(.white )
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                .frame(width: UIScreen.main.bounds.width - 40)
                .background(

                    LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]),
                        startPoint: .leading, endPoint: .trailing)

                        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)).opacity(0.7), radius: 20, x: 7, y: 7)
                    
                )
        }
        )
        })
        
        .ignoresSafeArea(.all,edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $homeData.newData, content: {
            
            NewDataView(homeData: homeData)
        })
    }
}
