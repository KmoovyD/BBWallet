//
//  ViewModel.swift
//  BBWallet
//
//  Created by Leo Friskey on 24.11.2022.
//

import SwiftUI


class ViewModel: ObservableObject {
    
    
    //@AppStorage("loggedIn") var loggedIn = false
    @Published var loggedIn = true
    @AppStorage("appUsers") var users = [AppUser(email: "test@test.com", username: "test", password: "1234Test")]
    @AppStorage("currentUser") var currentUser: AppUser?
}
