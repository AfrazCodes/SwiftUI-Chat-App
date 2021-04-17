//
//  SignInView.swift
//  Messenger
//
//  Created by Afraz Siddiqui on 4/17/21.
//

import SwiftUI

struct SignInView: View {
    @State var username: String = ""
    @State var password: String = ""

    @EnvironmentObject var model: AppStateModel

    var body: some View {
        NavigationView {
            VStack {
                // Heading
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                Text("Messenger")
                    .bold()
                    .font(.system(size: 34))

                // Textfields

                VStack {
                    TextField("Username", text: $username)
                        .modifier(CustomField())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)

                    SecureField("Password", text: $password)
                        .modifier(CustomField())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)

                    Button(action: {
                        self.signIn()
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 220, height: 50)
                            .background(Color.blue)
                            .cornerRadius(6)
                    })
                }
                .padding()

                Spacer()

                // Sign up
                HStack {
                    Text("New to Messenger?")
                    NavigationLink("Create Account", destination: SignUpView())
                }
            }
        }
    }

    func signIn() {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }

        model.signIn(username: username, password: password)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
