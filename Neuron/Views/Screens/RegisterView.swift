//
//  RegisterView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    @Binding var showingRegister: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    switch viewModel.activeScreen {
                    case 0:
                        EmailView()
                            .environmentObject(viewModel)
                    case 1:
                        PersonalInfoView()
                            .environmentObject(viewModel)
                    case 2:
                        ProfilePictureView()
                            .environmentObject(viewModel)
                    case 3:
                        CurrentClassesView()
                            .environmentObject(viewModel)
                    case 4:
                        TutorClassesView()
                            .environmentObject(viewModel)
                    case 5:
                        TutorPreferencesView()
                            .environmentObject(viewModel)
                    default:
                        Text("Error showing views: invalid screen code \(viewModel.activeScreen)")
                    }
                    
                    if (viewModel.activeScreen < 5) {
                        if (viewModel.activeScreen == 2 && viewModel.pfpItem == nil) {
                            NButton(title: "Skip", background: Color(uiColor: .systemBackground), foreground: Color(.appDarkBlue)) {
                                viewModel.activeScreen += 1
                            }
                            .border(Color(.appDarkBlue))
                        } else {
                            if (!viewModel.registering) {
                                NButton(title: "Next", background: Color("appDarkBlue")) {
                                    guard viewModel.validate() else { return }
                                    viewModel.activeScreen += 1
                                }
                                .alert(viewModel.errorTitle, isPresented: $viewModel.showingError) {
                                    Button("Retry") {}
                                } message: {
                                    Text(viewModel.errorMessage)
                                }
                            } else {
                                ProgressView()
                            }
                        }
                    } else if (viewModel.activeScreen == 5) {
                        NButton(title: "Register", background: Color(.appDarkBlue)) {
                            viewModel.register()
                        }
                        
                    }
                }
                .padding()
                .alert("Are you sure you want to leave?", isPresented: $viewModel.showingCancelAlert) {
                    Button("Leave", role: .destructive) {
                        showingRegister = false
                    }
                    .bold()
                } message: {
                    Text("You will lose all your progress.")
                }
                
                Spacer()
            }
            .toolbar {
                if (viewModel.activeScreen > 0 && !viewModel.registering) {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button {
                            viewModel.activeScreen -= 1
                        } label: {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                            .font(Font.custom("Maven Pro", size: 16)
                                .weight(.medium))
                            .tint(Color("appDarkBlue"))
                        }
                    }
                }
                
                ToolbarItemGroup(placement: .principal) {
                    Text("Register")
                        .font(Font.custom("Maven Pro", size: 24)
                            .weight(.medium))
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        viewModel.showingCancelAlert = true
                    } label: {
                        Text("Cancel")
                            .font(Font.custom("Maven Pro", size: 16)
                                .weight(.medium))
                            .tint(Color("appDarkBlue"))
                    }
                }
            }
        }
        .onAppear(perform: viewModel.refreshClasses)
    }
}

#Preview {
    RegisterView(showingRegister: Binding.constant(true))
}
