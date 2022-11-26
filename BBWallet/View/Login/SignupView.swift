//
//  SignupView.swift
//  BBWallet
//
//  Created by Leo Friskey on 24.11.2022.
//

import SwiftUI

enum ValidationMistakes {
    static let passTooShort = "Password is too short"
    static let passTooLong = "Password is too long"
    static let passTooEasy = "Password must contain numbers, both upper and lowercase letters"
    static let usernameTaken = "This username is already occupied"
    static let passwordNotMatch = "Passwords doesn't match"
}


struct SignupView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    @State private var email = ""
    @State private var isEmailValid: Bool? = nil
    @State private var emailWasTaken = false
    
    @State private var rememberMe = false
    @State private var showPass = false
    
    @State private var password1 = ""
    @State private var password2 = ""
    @State private var passMistake: String? = nil
    @State private var passMismatch: String? = nil
    @State private var isPasswordValid: Bool? = nil
    
    @State private var userAdded = false
    @State private var userFound = false
    @State private var isSecure = true
    
    var body: some View {
        ZStack {
            Image("bbwalletDarkBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Color.clear.frame(height: UIScreen.height * 0.2)
                HStack {
                    Text("Sign up to BBWallet")
                        .fontWeight(.bold)
                        .font(.system(size: 27))
                    Spacer()
                }
                .padding(.leading, 30)
                .padding(.vertical)
                
                ScrollView {
                    VStack(spacing: 20) {
                        VStack {
                            HStack {
                                Group {
                                    Text("Email")
                                    +
                                    Text(" *")
                                        .foregroundColor(.orange)
                                }
                                Spacer()
                            }
                            .padding(.leading, 40)
                            TextField("Email", text: $email)
                                .padding(16)
                                .frame(width: UIScreen.width * 0.9, height: 40)
                                .background {
                                    LinearGradient(colors: [.init(red: 11/255, green: 10/255, blue: 10/255), .init(red: 24/255, green: 25/255, blue: 27/255)], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .cornerRadius(20)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(.white.opacity(0.12))
                                                .blur(radius: 4)
                                                .offset(x: -4, y: -5)
                                        )
                                }
                                .overlay {
                                    isEmailValid == false || emailWasTaken == true ?
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.red.opacity(0.8))
                                    : isEmailValid == true && isPasswordValid == true && emailWasTaken == false && passMismatch == nil ?
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.green.opacity(0.8))
                                    :
                                    nil
                                }
                            
                            if emailWasTaken == false {
                                HStack {
                                    Text("Enter correct email")
                                        .foregroundColor(.red)
                                        .font(.system(size: 14))
                                    Spacer()
                                }
                                .padding(.horizontal, 25)
                                .opacity(isEmailValid == false ? 1 : 0)
                            } else {
                                HStack {
                                    Text("This email is already registred")
                                        .foregroundColor(.red)
                                        .font(.system(size: 14))
                                    Spacer()
                                }
                                .padding(.horizontal, 25)
                            }
                        }
                        
                        VStack {
                            HStack {
                                Group {
                                    Text("Password")
                                    +
                                    Text(" *")
                                        .foregroundColor(.orange)
                                }
                                Spacer()
                            }
                            .padding(.leading, 40)
                            
                            HybridTextField(isValid: $isPasswordValid, pass: $password1, isSecure: $isSecure, titleKey: "Password", emailValid: isEmailValid, passMismatch: passMismatch)
                            
                            HStack {
                                if let passMistake {
                                    Text(passMistake)
                                        .foregroundColor(.red)
                                        .font(.system(size: 14))
                                } else {
                                    Text("")
                                        .foregroundColor(.red)
                                        .font(.system(size: 14))
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 25)
                            .opacity(isPasswordValid == false ? 1 : 0)
                        }
                        
                        VStack {
                            HStack {
                                Group {
                                    Text("Repeat password")
                                    +
                                    Text(" *")
                                        .foregroundColor(.orange)
                                }
                                Spacer()
                            }
                            .padding(.leading, 40)
                            HybridTextField(isValid: passMismatch == nil ? $isPasswordValid : .constant(false), pass: $password2, isSecure: $isSecure, titleKey: "Password", emailValid: isEmailValid, passMismatch: passMismatch)
                            
                            HStack {
                                if let passMismatch {
                                    Text(passMismatch)
                                        .foregroundColor(.red)
                                        .font(.system(size: 14))
                                } else {
                                    Text("")
                                        .foregroundColor(.red)
                                        .font(.system(size: 14))
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 25)
                        }
                        
                        Button {
                            var email = true
                            var password = true
                            
                            for user in viewModel.users {
                                if user.email.lowercased() == self.email.lowercased() {
                                    emailWasTaken = true
                                    email = false
                                }
                            }
                            
                            if password1 != password2 {
                                passMismatch = ValidationMistakes.passwordNotMatch
                                password = false
                            } else {
                                passMismatch = nil
                            }
                            isPasswordValid = validatePass(password1)
                            if isPasswordValid == false {
                                password = false
                            }
                            
                            isEmailValid = textFieldValidatorEmail(self.email)
                            if isEmailValid == false {
                                email = false
                            }
                            
                            if email == true && password == true {
                                viewModel.users.append(AppUser(email: self.email.lowercased(), password: self.password1))
                                withAnimation(.linear(duration: 0.2)) {
                                    userAdded = true
                                }
                                viewModel.currentUser = viewModel.users.first(where: { $0.email.lowercased() == self.email.lowercased() })
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    viewModel.loggedIn = true
                                }
                            }
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(red: 255/255, green: 167/255, blue: 1/255))
                                    .frame(width: UIScreen.width * 0.9, height: 50)
                                Text("Sign up")
                                    .font(.custom("Fact", size: 20))
                                    .foregroundColor(.white)
                            }
                            .scaleEffect(emailWasTaken == false && userAdded == true ? 0 : 1)
                        }
                        
                        HStack {
                            Text("Already have an account?")
                                .foregroundColor(.secondary)
                            NavigationLink {
                                SigninView()
                            } label: {
                                Text("Sign in")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.orange)
                            }
                        }
                        .opacity(emailWasTaken == false && userAdded == true ? 0 : 1)
                    }
                    .padding(.vertical)
                }
            }
        }
    }
    
    private func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 40 && string.count <= 0 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    private func validatePass(_ pass: String) -> Bool {
        if pass.count > 50 {
            passMistake = ValidationMistakes.passTooLong
            return false
        }
        if pass.count < 8 {
            passMistake = ValidationMistakes.passTooShort
            return false
        }
        let passwordRegx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", passwordRegx)
        let bool = passwordCheck.evaluate(with: pass)
        if bool == false {
            passMistake = ValidationMistakes.passTooEasy
        }
        return bool
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView().environmentObject(ViewModel()).environment(\.colorScheme, .dark)
    }
}


fileprivate struct HybridTextField: View {
    @Binding var isValid: Bool?
    @Binding var pass: String
    @Binding var isSecure: Bool
    
    var titleKey: String
    var emailValid: Bool?
    var passMismatch: String?
    
    var body: some View {
        if isSecure{
            SecureField(titleKey, text: $pass)
                .padding(16)
                .frame(width: UIScreen.width * 0.9, height: 40)
                .background {
                    LinearGradient(colors: [.init(red: 11/255, green: 10/255, blue: 10/255), .init(red: 24/255, green: 25/255, blue: 27/255)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .cornerRadius(20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white.opacity(0.12))
                                .blur(radius: 4)
                                .offset(x: -4, y: -5)
                        )
                }
                .overlay(
                    isValid == false ?
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.red.opacity(0.8))
                    : isValid == true && emailValid == true && passMismatch == nil ?
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.green.opacity(0.8))
                    :
                    nil
                )
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            withAnimation(.linear(duration: 0.2)) {
                                isSecure = false
                            }
                        } label: {
                            Image(systemName: "eye.slash")
                                .foregroundColor(.white.opacity(0.2))
                        }
                    }
                    .padding(.horizontal)
                }
            
        } else{
            TextField(titleKey, text: $pass)
                .padding(16)
                .frame(width: UIScreen.width * 0.9, height: 40)
                .background {
                    LinearGradient(colors: [.init(red: 11/255, green: 10/255, blue: 10/255), .init(red: 24/255, green: 25/255, blue: 27/255)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .cornerRadius(20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white.opacity(0.12))
                                .blur(radius: 4)
                                .offset(x: -4, y: -5)
                        )
                }
                .overlay(
                    isValid == false ?
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.red.opacity(0.8))
                    : isValid == true && emailValid == true && passMismatch == nil ?
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.green.opacity(0.8))
                    :
                    nil
                )
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            withAnimation(.linear(duration: 0.2)) {
                                isSecure = true
                            }
                        } label: {
                            Image(systemName: "eye")
                                .foregroundColor(.white.opacity(0.2))
                        }
                    }
                    .padding(.horizontal)
                }
        }
    }
}
