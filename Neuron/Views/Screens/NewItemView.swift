//
//  NewItemView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.title)
                .bold()
                .padding(.top, 100)
            
            Form {
                TextField("Name", text: $viewModel.name)
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                
                NButton(title: "Save",
                         background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert("Please fill in all fields and select due date that is today or newer", isPresented: $viewModel.showAlert) {
                Button("Retry") {}
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding.constant(false))
}
