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
    @State private var navigationPath: [AppScreen] = []

    var body: some View {
        ZStack {
            // Global Background
            Theme.background.ignoresSafeArea()
            StarsView()

            // Screen Router
            Group {

                switch screen {
                case .welcome:
                    WelcomeView {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            screen = .nameInput
                        }
                    }
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(y: 30)),
                        removal: .opacity.combined(with: .offset(y: -30))
                    ))

                case .nameInput:
                    NameInputView(session: session) {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            screen = .subjectSelection
                        }
                    }
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(y: 30)),
                        removal: .opacity.combined(with: .offset(y: -30))
                    ))

                case .subjectSelection:
                    SubjectSelectionView(session: session) {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            screen = .quiz
                        }
                    }
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
                        withAnimation(.easeInOut(duration: 0.4)) {
                            screen = .results
                        }
                    }
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(y: 30)),
                        removal: .opacity.combined(with: .offset(y: -30))
                    ))

                case .results:
                    ResultsView(session: session) { career in
                        withAnimation(.easeInOut(duration: 0.4)) {
                            screen = .careerDetail(career)
                        }
                    } onExtraTools: {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            screen = .extraTools
                        }
                    } onReset: {
                        session.reset()
                        withAnimation(.easeInOut(duration: 0.4)) {
                            screen = .welcome
                        }
                    }
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(y: 30)),
                        removal: .opacity.combined(with: .offset(y: -30))
                    ))

                case .careerDetail(let career):
                    CareerDetailView(career: career, session: session) {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            screen = .results
                        }
                    }
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(x: 40)),
                        removal: .opacity.combined(with: .offset(x: -40))
                    ))

                case .extraTools:
                    ExtraToolsView(session: session) {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            screen = .results
                        }
                    }
                    .transition(.asymmetric(
                        insertion: .opacity.combined(with: .offset(y: 30)),
                        removal: .opacity.combined(with: .offset(y: -30))
                    ))
                }
            }
            .animation(.easeInOut(duration: 0.35), value: UUID())
        }
        .preferredColorScheme(session.isDarkMode ? .dark : .light)
        .animation(.easeInOut(duration: 0.4), value: session.isDarkMode)
    }
}
