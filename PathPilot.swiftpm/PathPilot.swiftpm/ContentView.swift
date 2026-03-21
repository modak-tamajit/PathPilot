import SwiftUI

// MARK: - App Flow Enum
enum AppScreen {
    case welcome
    case nameInput
    case subjectSelection
    case quiz
    case results
    case careerDetail(Career)
    case extraTools
}

// MARK: - Root View
struct ContentView: View {
    @StateObject private var session = AppSession()
    @State private var screen: AppScreen = .welcome

    // Increments on every navigation — used as the stable animation trigger.
    // Fixes the UUID() bug where animation fired on every render pass.
    @State private var screenTransitionID = 0

    private func navigate(to next: AppScreen) {
        withAnimation(.easeInOut(duration: 0.4)) {
            screenTransitionID += 1
            screen = next
        }
    }

    var body: some View {
        ZStack {
            // Global Background
            Theme.background.ignoresSafeArea()
            StarsView()

            Group {
                switch screen {

                case .welcome:
                    WelcomeView {
                        navigate(to: .nameInput)
                    }
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(y: 30)),
                        removal: .opacity.combined(with: .offset(y: -30))
                    ))

                case .nameInput:
                    NameInputView(session: session, onBack: {
                        navigate(to: .welcome)
                    }, onContinue: {
                        navigate(to: .subjectSelection)
                    })
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(y: 30)),
                        removal: .opacity.combined(with: .offset(y: -30))
                    ))

                case .subjectSelection:
                    SubjectSelectionView(session: session, onBack: {
                        navigate(to: .nameInput)
                    }, onContinue: {
                        navigate(to: .quiz)
                    })
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(y: 30)),
                        removal: .opacity.combined(with: .offset(y: -30))
                    ))

                case .quiz:
                    QuizView(session: session) {
                        let (primary, alternate) = computeCareers(
                            subjects: session.selectedSubjects,
                            scores: session.personalityScores
                        )
                        session.primaryCareers = primary
                        session.alternateCareers = alternate
                        session.motivationalQuote = getMotivationalQuote(for: session.topTrait)
                        if let first = primary.first {
                            session.goals = generate30DayPlan(for: first)
                        }
                        navigate(to: .results)
                    }
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(y: 30)),
                        removal: .opacity.combined(with: .offset(y: -30))
                    ))

                case .results:
                    ResultsView(session: session) { career in
                        navigate(to: .careerDetail(career))
                    } onExtraTools: {
                        navigate(to: .extraTools)
                    } onReset: {
                        session.reset()
                        navigate(to: .welcome)
                    }
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(y: 30)),
                        removal: .opacity.combined(with: .offset(y: -30))
                    ))

                case .careerDetail(let career):
                    CareerDetailView(career: career, session: session) {
                        navigate(to: .results)
                    }
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(x: 40)),
                        removal: .opacity.combined(with: .offset(x: -40))
                    ))

                case .extraTools:
                    ExtraToolsView(session: session) {
                        navigate(to: .results)
                    }
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(y: 30)),
                        removal: .opacity.combined(with: .offset(y: -30))
                    ))
                }
            }
            // Fix: animate on screenTransitionID (stable Int), NOT UUID() which fires every render
            .animation(.easeInOut(duration: 0.35), value: screenTransitionID)
        }
        .preferredColorScheme(session.isDarkMode ? .dark : .light)
        .animation(.easeInOut(duration: 0.4), value: session.isDarkMode)
    }
}
