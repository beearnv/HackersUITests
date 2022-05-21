//
//  LoginView.swift
//  Hackers
//
//  Created by Weiran Zhang on 04/04/2022.
//  Copyright © 2022 Weiran Zhang. All rights reserved.
//

import SwiftUI
import Swinject
import SwinjectStoryboard
import PromiseKit

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isAuthenticating = false
    @State private var showAlert = false

    @Inject private var sessionService: SessionService

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Text("Login to Hacker News")
                    .font(.largeTitle)
                    .padding(.bottom, 30)
                    .accessibilityIdentifier("loginTitle")

                TextField("Username", text: $username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textFieldStyle(RoundedTextField())
                    .textContentType(.username)
                    .accessibilityIdentifier("usernameField")

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedTextField())
                    .textContentType(.password)
                    .accessibilityIdentifier("passwordField")

                Text("Hackers never stores your password")
                    .foregroundColor(Color.secondary)
                    .font(.footnote)
                    .accessibilityIdentifier("trustTitle")

                Button("Login") {
                    isAuthenticating = true
                    sessionService.authenticate(username: username, password: password)
                        .done { _ in
                            presentationMode.wrappedValue.dismiss()
                        }.ensure {
                            NotificationCenter.default.post(name: Notification.Name.refreshRequired, object: nil)
                            isAuthenticating = false
                        }.catch { _ in
                            showAlert = true
                            password = ""
                        }
                }.buttonStyle(FilledButton())
                    .padding(.top, 30)
                    .disabled(isAuthenticating)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Login Failed"),
                            message: Text("Error logging into Hacker News, check your username and password.")
                        )
                    }
                    .accessibilityIdentifier("loginButton")

                LabelledDivider(label: "or")

                Link(destination: URL(string: "https://news.ycombinator.com/login")!) {
                    HStack {
                        Text("Register on Hacker News")
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                    .padding()
                    .accessibilityIdentifier("registerButton")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Done")
                            .bold()
                    }
                    .accessibilityIdentifier("doneButton")
                }
            }
        }
    }
}

struct RoundedTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.all, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.secondary, lineWidth: 0.5)
            )
            .padding(.horizontal, 20)
    }
}

struct FilledButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding()
            .padding(.horizontal, 50)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .background(Color.accentColor)
            .cornerRadius(5)
            .padding(.horizontal, 20)
    }
}

struct LabelledDivider: View {
    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .secondary) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
