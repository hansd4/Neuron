//
//  LoginView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import SwiftUI

struct LoginView: View {
    enum FocusedField {
        case email, password
    }
    
    @StateObject var viewModel = LoginViewModel()
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    VStack {
                        Color("appDarkBlue")
                            .ignoresSafeArea()
                            .frame(height: geo.size.height * 0.7)
                        Color(uiColor: .systemBackground)
                            .ignoresSafeArea()
                    }
                    
                    VStack {
                        Text("Neuron")
                            .font(Font.custom("Maven Pro", size: 42)
                                .weight(.medium))
                            .foregroundStyle(Color("appOffWhite"))
                            .padding(.top, 24)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color(uiColor: .systemBackground))
                                .stroke(.secondary, lineWidth: 1)
                                .frame(maxWidth: .infinity, maxHeight: 225)
                                .padding()
                            
                            VStack(alignment: .leading) {
                                NTextField(title: "Enter your email",
                                           placeholder: "Email Address",
                                           text: $viewModel.email)
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled()
                                    .focused($focusedField, equals: .email)
                                    .onSubmit {
                                        focusedField = .password
                                    }
                                
                                NSecureField(title: "Enter your password",
                                           placeholder: "Password",
                                           text: $viewModel.password)
                                    .focused($focusedField, equals: .password)
                                    .onSubmit {
                                        viewModel.login()
                                    }
                                
                                NButton(title: "Log in",
                                        background: Color("appDarkBlue")) {
                                    viewModel.login()
                                }
                                .alert(viewModel.errorTitle, isPresented: $viewModel.showingAlert) {
                                    Button("Retry") {}
                                } message: {
                                    Text(viewModel.errorMessage)
                                }
                            }
                            .padding(30)
                        }
                        
                        Button("Sign up") {
                            viewModel.showingRegister = true
                        }
                        .font(Font.custom("Maven Pro", size: 16))
                        .sheet(isPresented: $viewModel.showingRegister) {
                            RegisterView(showingRegister: $viewModel.showingRegister)
                        }
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
