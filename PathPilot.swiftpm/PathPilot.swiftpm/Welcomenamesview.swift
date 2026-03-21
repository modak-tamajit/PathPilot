import SwiftUI

// MARK: - Welcome / Splash Screen
struct WelcomeView: View {
    let onStart: () -> Void
    @State private var appeared = false
    @State private var pulse = false

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            // Hero Icon
            ZStack {
                Circle()
                    .fill(Theme.gradientAccent)
                    .frame(width: 110, height: 110)
                    .opacity(0.15)
                    .scaleEffect(pulse ? 1.3 : 1.0)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: pulse)

                Circle()
                    .fill(Theme.gradientAccent)
                    .frame(width: 85, height: 85)
                    .opacity(0.2)

                Text("🧭")
                    .font(.system(size: 52))
            }
            .scaleEffect(appeared ? 1 : 0.3)
            .opacity(appeared ? 1 : 0)
            .animation(.spring(response: 0.6, dampingFraction: 0.55).delay(0.1), value: appeared)

            Spacer().frame(height: 28)

            VStack(spacing: 8) {
                Text("PathPilot")
                    .font(.system(size: 46, weight: .heavy, design: .rounded))
                    .foregroundStyle(Theme.gradientHero)
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 24)
                    .animation(.easeOut(duration: 0.5).delay(0.3), value: appeared)

                Text("Discover Your Direction")
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .foregroundColor(Theme.textSecondary)
                    .opacity(appeared ? 1 : 0)
                    .animation(.easeOut.delay(0.45), value: appeared)
            }

            Spacer().frame(height: 40)

            VStack(spacing: 10) {
                FeaturePill(icon: "🧠", text: "Psychology-based career matching")
                FeaturePill(icon: "🗺️", text: "Personalized learning roadmap")
                FeaturePill(icon: "🎓", text: "College & exam guidance")
                FeaturePill(icon: "⚡️", text: "Under 3 minutes — fully offline")
            }
            .padding(.horizontal, 32)
            .opacity(appeared ? 1 : 0)
            .offset(y: appeared ? 0 : 20)
            .animation(.easeOut.delay(0.6), value: appeared)

            Spacer()

            Button(action: onStart) {
                HStack(spacing: 10) {
                    Text("Begin Your Journey")
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 20))
                }
                .modifier(PrimaryButtonStyle())
            }
            .padding(.horizontal, 32)
            .opacity(appeared ? 1 : 0)
            .animation(.easeOut.delay(0.8), value: appeared)

            Spacer().frame(height: 40)
        }
        .onAppear {
            appeared = true
            pulse = true
        }
    }
}

struct FeaturePill: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 12) {
            Text(icon)
                .font(.system(size: 16))
            Text(text)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(Theme.textSecondary)
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 14))
                .foregroundColor(.cyan.opacity(0.7))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .glassCard(opacity: 0.06, cornerRadius: 12)
    }
}

// MARK: - Name Input Screen
struct NameInputView: View {
    @ObservedObject var session: AppSession
    let onBack: () -> Void
    let onContinue: () -> Void
    @State private var appeared = false
    @FocusState private var isFocused: Bool

    var isValid: Bool {
        !session.userName.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        VStack(spacing: 0) {
            // Fix: added back button — was missing, user was trapped on this screen
            HStack {
                NavBackButton(label: "Back", action: onBack)
                Spacer()
            }
            .padding(.horizontal, 28)
            .padding(.top, 56)

            Spacer()

            VStack(spacing: 32) {
                VStack(spacing: 10) {
                    Text("👋")
                        .font(.system(size: 60))
                        .scaleEffect(appeared ? 1 : 0.3)
                        .animation(.spring(response: 0.5, dampingFraction: 0.5).delay(0.1), value: appeared)

                    Text("Hey there!")
                        .font(.system(size: 36, weight: .heavy, design: .rounded))
                        .foregroundStyle(Theme.gradientHero)
                        .opacity(appeared ? 1 : 0)
                        .animation(.easeOut.delay(0.25), value: appeared)

                    Text("Before we start, let's make this personal.")
                        .font(.system(size: 16, design: .rounded))
                        .foregroundColor(Theme.textSecondary)
                        .multilineTextAlignment(.center)
                        .opacity(appeared ? 1 : 0)
                        .animation(.easeOut.delay(0.35), value: appeared)
                }

                VStack(alignment: .leading, spacing: 14) {
                    Text("What should I call you?")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(Theme.textSecondary)

                    TextField("Your name...", text: $session.userName)
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .foregroundColor(Theme.textPrimary)
                        .padding(18)
                        .background(Color.white.opacity(0.08))
                        .cornerRadius(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(isFocused ? Color.cyan.opacity(0.7) : Color.white.opacity(0.12), lineWidth: 1.5)
                        )
                        .tint(.cyan)
                        .focused($isFocused)
                        .submitLabel(.done)
                        .onSubmit { if isValid { onContinue() } }

                    if !session.userName.isEmpty {
                        Text("Nice to meet you, \(session.userName)! 🌟")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(.cyan)
                            .transition(.opacity.combined(with: .offset(y: 8)))
                            .animation(.easeOut, value: session.userName)
                    }
                }
                .padding(24)
                .glassCard()
                .padding(.horizontal, 28)
                .opacity(appeared ? 1 : 0)
                .offset(y: appeared ? 0 : 30)
                .animation(.easeOut.delay(0.4), value: appeared)
            }

            Spacer()

            Button(action: {
                if isValid {
                    isFocused = false
                    onContinue()
                }
            }) {
                HStack(spacing: 10) {
                    Text("Continue")
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 20))
                }
                .modifier(PrimaryButtonStyle(isDisabled: !isValid))
            }
            .disabled(!isValid)
            .padding(.horizontal, 32)
            .opacity(appeared ? 1 : 0)
            .animation(.easeOut.delay(0.5), value: appeared)

            Spacer().frame(height: 50)
        }
        // Fix: tap anywhere outside the field to dismiss keyboard
        .onTapGesture { isFocused = false }
        .onAppear {
            appeared = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                isFocused = true
            }
        }
    }
}
