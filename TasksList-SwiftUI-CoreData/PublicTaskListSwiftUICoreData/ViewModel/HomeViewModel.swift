//
//  HomeViewModel.swift
//  PublicTaskListSwiftUICoreData
//
//  Created by Олег Тарасенко on 10/6/20.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    
    @Published var content = ""
    @Published var date = Date()
    @Published var newData = false
    
    //Check and upgrate date
    
    // Storing update data
    @Published var updateItem : Task!
    
    
    let calendar = Calendar.current
    
    func checkDate() -> String  {
        
        if calendar.isDateInToday(date) {
            return "Сегодня"
        } else if calendar.isDateInTomorrow(date) {
            return "  Завтра  "
        } else {
            return "Любой день"
        }
        
    }
    
    func updateDate(value: String)  {
        
        switch value {
        case "Сегодня":
            date = Date()
        case "  Завтра  ":
            date = calendar.date(byAdding: .day, value: 1, to: Date())!
        default:
            break
        }
           
        
//        if value == "Сегодня"{date = Date()}
//        else if value == "Завтра" { date = calender.date(byAdding: .day, value: 1, to: Date())!
//        } else{ "777"}
    
    }
    
    func writeData(context : NSManagedObjectContext)  {
        
        // Update Data
        if updateItem != nil {
            
            updateItem.content = content
            updateItem.date = date
            try! context.save()
            
            //removing update data if successfull
            
            updateItem = nil
            newData.toggle()
            content = ""
            date = Date()
            return
        }
        
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        do {
            
            try context.save()
            newData.toggle()
            content = ""
            date = Date()
            
        } catch  {
            print(error.localizedDescription)
        }
        
       
    }
    
    func editItem(item: Task)  {
        updateItem = item
        // togging the newDataView
        date = item.date!
        content = item.content!
        newData.toggle()
    }
}
