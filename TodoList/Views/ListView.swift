//
//  ListView.swift
//  TodoList
//
//  Created by Ravikanth Thummala on 7/22/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
        
    var body: some View {
        
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.udpateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(.sidebar)
        .navigationTitle("Toda List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
        
    }
    
  
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

