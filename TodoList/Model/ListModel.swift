//
//  ListModel.swift
//  TodoList
//
//  Created by Ravikanth Thummala on 7/22/23.
//

import Foundation
import SwiftUI

struct ListModel: Identifiable{
    
    let id:String
    let title:String
    let isCompleted:Bool
    
    init(id:String = UUID().uuidString,title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCompletion() -> ListModel {
        return ListModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
