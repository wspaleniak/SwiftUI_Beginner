//
//  UserOnboardingIntroView.swift
//  SwiftUIBeginner
//
//  Created by Wojciech Spaleniak on 06/05/2024.
//

import SwiftUI

// MARK: - View

struct UserOnboardingIntroView: View {
    
    // MARK: - Properties
    
    /// Zmienna pozwala przechowywać w cache urządzenia dane o zalogowaniu usera.
    @AppStorage("signed_in") private var userSignedIn: Bool = false
    
    /// Specjalne przejście dla widoku profilu.
    private let profileTransition: AnyTransition = .asymmetric(
        insertion: .move(edge: .bottom),
        removal: .move(edge: .top)
    )
    
    /// Specjalne przejście dla widoku onboardingu.
    private let onboardingTransition: AnyTransition = .asymmetric(
        insertion: .move(edge: .top),
        removal: .move(edge: .bottom)
    )
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // Background
            RadialGradient(
                colors: [.purple, .indigo, .blue],
                center: .topLeading,
                startRadius: 50,
                endRadius: UIScreen.main.bounds.height
            )
            .ignoresSafeArea()
            
            // Foreground
            if userSignedIn {
                UserOnboardingProfileView()
                    .transition(profileTransition)
            } else {
                UserOnboardingOnboardingView()
                    .transition(onboardingTransition)
            }
        }
        .animation(.bouncy, value: userSignedIn)
        /// W powyższym przykładzie trzeba użyć `.animation()` na całym widoku
        /// Bo inaczej nie działa dodane do widoków `.transition()`
        /// Nawet jeśli zmienna `userSignedIn` jest modyfikowana na innym widoku w `withAnimation`
    }
}

// MARK: - Preview

#Preview {
    UserOnboardingIntroView()
}
