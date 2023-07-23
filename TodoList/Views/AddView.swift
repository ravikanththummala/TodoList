//
//  AddView.swift
//  TodoList
//
//  Created by Ravikanth Thummala on 7/22/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    

    var body: some View {
        
        ScrollView {
            VStack {
                TextField("Type somethinh here....", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                
                Button { saveButtonPressed() } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(14)
        }
        .navigationTitle("Add an item ✍️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropiate(){
            listViewModel.saveItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textIsAppropiate() -> Bool {
        if textFieldText.count < 3{
            alertTitle = "Your new todo items must be at least 3 characters..🤨"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
    
        return Alert(title: Text(alertTitle))
    }

}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
