//
//  ContentView.swift
//  SiwaTest
//
//  Created by Ruslan Murin on 29.11.2022.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        SignInWithAppleButton(.signIn) { request in
            request.requestedScopes = [.email, .fullName]
        } onCompletion: { result in
            switch result {
            case .success(let auth):
                switch auth.credential {
                case let credential as ASAuthorizationAppleIDCredential:
                    let userId = credential.user
                    print(userId, credential)
                default:
                    break
                }
            case .failure(let error):
                print(error)
            }
        }
        .signInWithAppleButtonStyle(colorScheme == .light ? .black : .white)
        .frame(height: 44)
        .clipShape(Capsule())
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
