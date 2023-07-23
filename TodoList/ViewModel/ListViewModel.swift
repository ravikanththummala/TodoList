//
//  ListViewModel.swift
//  TodoList
//
//  Created by Ravikanth Thummala on 7/22/23.
//

import Foundation
import SwiftUI

class ListViewModel : ObservableObject{
 
    @Published var items:[ListModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItem = [
            ListModel(title: "This is the fist item", isCompleted: true),
            ListModel(title: "This is the fist item1", isCompleted: false),
            ListModel(title: "This is the fist item2", isCompleted: true)
        ]
        items.append(contentsOf: newItem)
    }
    
    func saveItem(title:String){
        let newItem = ListModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func deleteItem(indeSet:IndexSet){
        items.remove(atOffsets: indeSet)
    }
    func moveItem(indeSet:IndexSet,offSet:Int){
        items.move(fromOffsets: indeSet, toOffset: offSet)
    }

    func udpateItem(item:ListModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
}
