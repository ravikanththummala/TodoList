//
//  ListRowView.swift
//  TodoList
//
//  Created by Ravikanth Thummala on 7/22/23.
//

import SwiftUI

struct ListRowView: View {
    let item:ListModel
    var body: some View {
        HStack {
            Image(systemName:item.isCompleted ? "checkmark.circle" :  "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item: ListModel(title: "checkmark.circle",isCompleted: true))
            .previewLayout(.sizeThatFits)
    }

}
