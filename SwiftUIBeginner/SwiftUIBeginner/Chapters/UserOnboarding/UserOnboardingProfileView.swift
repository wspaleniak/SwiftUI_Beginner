//
//  UserOnboardingProfileView.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 08/05/2024.
//

import SwiftUI

// MARK: - View

struct UserOnboardingProfileView: View {
    
    // MARK: - Properties
    
    /// Zmienna pozwala przechowywać w cache urządzenia dane o zalogowaniu usera.
    @AppStorage("signed_in") private var userSignedIn: Bool = false
    
    /// Zmienna pozwala przechowywać w cache urządzenia dane o userze - imię.
    @AppStorage("user_name") private var userName: String?
    
    /// Zmienna pozwala przechowywać w cache urządzenia dane o userze - wiek.
    @AppStorage("user_age") private var userAge: Int?
    
    /// Zmienna pozwala przechowywać w cache urządzenia dane o userze - płeć.
    @AppStorage("user_gender") private var userGender: String?
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text(userName ?? "Your name here")
            
            Text("This user is \(userAge ?? 0) years old")
            
            Text("Their gender is \(userGender ?? "unknown")")
            
            signOutButton
        }
        .font(.title2)
        .fontWeight(.semibold)
        .foregroundStyle(.white)
        .padding(.top, 50)
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.white.opacity(0.25))
        )
        .padding(30)
    }
    
    // MARK: - Subviews
    
    // Sign out button
    private var signOutButton: some View {
        Button(action: {
            userName = nil
            userAge = nil
            userGender = nil
            userSignedIn = false
        }, label: {
            Text("SIGN OUT")
                .font(.headline)
                .foregroundStyle(.purple)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                )
        })
        .padding(.top, 30)
    }
}

// MARK: - Preview

#Preview {
    UserOnboardingProfileView()
        .background(
            RadialGradient(
                colors: [.purple, .indigo, .blue],
                center: .topLeading,
                startRadius: 50,
                endRadius: UIScreen.main.bounds.height
            )
        )
}
