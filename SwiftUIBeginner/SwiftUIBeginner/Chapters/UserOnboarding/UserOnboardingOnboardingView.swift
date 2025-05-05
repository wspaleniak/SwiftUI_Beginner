//
//  UserOnboardingOnboardingView.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 06/05/2024.
//

import SwiftUI

// MARK: - View

struct UserOnboardingOnboardingView: View {
    
    // MARK: - Enums
    
    enum ViewState {
        case welcome
        case addName
        case addAge
        case addGender
        
        /// Zmienna ustawia tytuł przycisku na dole ekranu.
        var nextButtonTitle: String {
            switch self {
            case .welcome: "SIGN UP"
            case .addName, .addAge: "NEXT"
            case .addGender: "FINISH"
            }
        }
    }
    
    enum Gender: String, CaseIterable {
        case male
        case female
        case other
    }
    
    // MARK: - Properties
    
    /// Zmienna pozwala przechowywać w cache urządzenia dane o zalogowaniu usera.
    @AppStorage("signed_in") private var userSignedIn: Bool = false
    
    /// Zmienna pozwala przechowywać w cache urządzenia dane o userze - imię.
    @AppStorage("user_name") private var userName: String?
    
    /// Zmienna pozwala przechowywać w cache urządzenia dane o userze - wiek.
    @AppStorage("user_age") private var userAge: Int?
    
    /// Zmienna pozwala przechowywać w cache urządzenia dane o userze - płeć.
    @AppStorage("user_gender") private var userGender: String?
    
    /// Zmienna przechowuje aktualny stan widoku.
    @State private var currentState: ViewState = .welcome
    
    /// Zmienna przechowuje imię usera.
    @State private var name: String = ""
    
    /// Zmienna przechowuje wiek usera.
    @State private var age: Double = 40
    
    /// Zmienna przechowuje płeć usera.
    @State private var gender: Gender = .other
    
    /// Zmienna przechowuje informację czy ma zostać pokazany alert.
    @State private var showAlert: Bool = false
    
    /// Zmienna przechowuje tytuł alerta.
    @State private var alertTitle: String = ""
    
    /// Specjalne przejście dla efektownej zmiany widoków.
    private let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading)
    )
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            switch currentState {
            case .welcome:
                welcomeSection
            case .addName:
                addNameSection
            case .addAge:
                addAgeSection
            case .addGender:
                addGenderSection
            }
            
            VStack {
                Spacer()
                nextButton
            }
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK") { }
        }
    }
    
    // MARK: - Subviews
    
    // Welcome section
    private var welcomeSection: some View {
        VStack(spacing: 30) {
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundStyle(.white)
            
            Text("Find your match!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 4)
                        .offset(y: 4)
                        .foregroundStyle(.white),
                    alignment: .bottom
                )
            
            Text("This is the #1 app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI amazing techniques bro XD")
                .font(.body)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .padding(.horizontal)
        }
        .padding()
        .transition(transition)
    }
    
    // Add name section
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            TextField("Your name...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                )
        }
        .padding()
        .transition(transition)
    }
    
    // Add age section
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Slider(value: $age, in: 18...100, step: 1)
                .tint(.white)
        }
        .padding()
        .transition(transition)
    }
    
    // Add gender section
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Picker("", selection: $gender) {
                ForEach(Gender.allCases, id: \.self) { gender in
                    Text(gender.rawValue.capitalized)
                }
            }
            .tint(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
            )
        }
        .padding()
        .transition(transition)
    }
    
    // Sign in button
    private var nextButton: some View {
        Button(action: {
            nextButtonTapped()
        }, label: {
            Text(currentState.nextButtonTitle)
                .font(.headline)
                .foregroundStyle(.purple)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                )
                .animation(nil, value: currentState)
        })
        .padding()
    }
    
    // MARK: - Private methods
    
    /// Metoda wykonuje się gdy użytkownik kliknie w przycisk na dole ekranu.
    private func nextButtonTapped() {
        withAnimation(.bouncy) {
            switch currentState {
            case .welcome:
                currentState = .addName
            case .addName:
                guard name.count >= 3 else {
                    alertTitle = "Name should have minimum 3 characters! 😫"
                    showAlert.toggle()
                    return
                }
                currentState = .addAge
            case .addAge:
                currentState = .addGender
            case .addGender:
                userName = name
                userAge = Int(age)
                userGender = gender.rawValue
                userSignedIn = true
            }
        }
    }
}

// MARK: - Preview

#Preview {
    UserOnboardingOnboardingView()
        .background(
            RadialGradient(
                colors: [.purple, .indigo, .blue],
                center: .topLeading,
                startRadius: 50,
                endRadius: UIScreen.main.bounds.height
            )
        )
}
