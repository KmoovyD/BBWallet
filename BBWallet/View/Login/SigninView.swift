//
//  SignupView.swift
//  BBWallet
//
//  Created by Leo Friskey on 24.11.2022.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {

    func makeBody(configuration: Self.Configuration) -> some View {

        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .regular, design: .default))
                configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }

    }
}

struct SigninView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    @State private var email = ""
    @State private var isEmailValid: Bool? = nil
    
    @State private var password = ""
    @State private var isPasswordValid: Bool? = nil
    
    @State private var rememberMe = false
    @State private var userFound = false
    
    @State private var passMistake: String? = nil
    
    var body: some View {
        ZStack {
            Image("bbwalletDarkBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Sign in to BBWallet")
                        .fontWeight(.bold)
                        .font(.system(size: 27))
                    Spacer()
                }
                .padding(.leading, 30)
                .padding(.vertical)
                
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
                            .overlay(
                                isEmailValid == false ?
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.red.opacity(0.8))
                                : isEmailValid == true && userFound == true ?
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.green.opacity(0.8))
                                :
                                nil
                            )
                        
                        HStack {
                            Text("Enter correct email")
                                .foregroundColor(.red)
                                .font(.system(size: 14))
                            Spacer()
                        }
                        .padding(.horizontal, 25)
                        .opacity(isEmailValid == false ? 1 : 0)
                        
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
                        
                        HybridTextField(isValid: isPasswordValid, pass: $password, titleKey: "Password", userFound: userFound)
                        
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
                    
                    HStack {
                        Toggle(isOn: $rememberMe) {
                            Text("Remember me")
                        }
                        .toggleStyle(CheckboxStyle())
                        Spacer()
                    }
                    .padding(.horizontal, 25)
                    
                    
                    if userFound == false && isEmailValid != nil {
                        Text("Invalid email or password. Try again.")
                            .foregroundColor(.red)
                            .padding(.vertical, 10)
                    }
                    
                    Button {
                        for user in viewModel.users {
                            if user.email.lowercased() == email.lowercased() && user.password == password {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    userFound = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    viewModel.loggedIn = true
                                }
                                isEmailValid = textFieldValidatorEmail(email)
                                isPasswordValid = validatePass(password)
                                return
                            }
                        }
                        isEmailValid = textFieldValidatorEmail(email)
                        isPasswordValid = validatePass(password)
                        
                        userFound = false
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 255/255, green: 167/255, blue: 1/255))
                                .frame(width: UIScreen.width * 0.9, height: 50)
                            Text("Sign in")
                                .font(.custom("Fact", size: 20))
                                .foregroundColor(.white)
                        }
                        .scaleEffect(userFound ? 0 : 1)
                    }
                    
                    HStack {
                        Text("Dont have an account?")
                            .foregroundColor(.secondary)
                        NavigationLink {
                            SignupView()
                        } label: {
                            Text("Register")
                                .fontWeight(.semibold)
                                .foregroundColor(.orange)
                        }
                    }
                    .opacity(userFound ? 0 : 1)
                }
                .padding(.vertical)
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

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView().environmentObject(ViewModel()).environment(\.colorScheme, .dark)
    }
}

fileprivate struct HybridTextField: View {
    var isValid: Bool?
    @Binding var pass: String
    @State private var isSecure: Bool = true
    
    var titleKey: String
    var userFound: Bool
    
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
                    : isValid == true && userFound == true ?
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
                    : isValid == true && userFound == true ?
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
