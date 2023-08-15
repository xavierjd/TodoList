//
//  AddView.swift
//  TodoList
//
//  Created by xavier on 12/08/23.
//

import SwiftUI

struct AddView: View {    
    
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                Button(action: {
                    saveButtonPressed()
                }, label:{
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item ✏️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}

extension AddView {
    public func saveButtonPressed(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    public func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 charactes long 😟"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    public func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}
