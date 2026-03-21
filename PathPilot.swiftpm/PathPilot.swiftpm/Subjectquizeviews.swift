import SwiftUI

// MARK: - Subject Selection Screen
struct SubjectSelectionView: View {
    @ObservedObject var session: AppSession
    let onBack: () -> Void
    let onContinue: () -> Void
    @State private var appeared = false

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var canContinue: Bool { session.selectedSubjects.count >= 2 }

    var body: some View {
        VStack(spacing: 0) {
            // Header with back navigation
            HStack {
                NavBackButton(label: "Back", action: onBack)
                Spacer()
                // Selected count badge
                if !session.selectedSubjects.isEmpty {
                    Text("\(session.selectedSubjects.count) selected")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(.cyan)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.cyan.opacity(0.12))
                        .cornerRadius(20)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 56)
            .padding(.bottom, 12)

            VStack(spacing: 6) {
                Text("What subjects do\nyou love? 📚")
                    .font(.system(size: 26, weight: .heavy, design: .rounded))
                    .foregroundStyle(Theme.gradientHero)
                    .multilineTextAlignment(.center)

                Text("Pick at least 2 that excite you")
                    .font(.system(size: 14, design: .rounded))
                    .foregroundColor(Theme.textSecondary)
            }
            .opacity(appeared ? 1 : 0)
            .animation(.easeOut.delay(0.1), value: appeared)
            .padding(.bottom, 12)

            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(Subject.byStream, id: \.stream) { group in
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 8) {
                                Text(group.stream.emoji)
                                    .font(.system(size: 15))
                                Text(group.stream.rawValue)
                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                    .foregroundColor(group.stream.color)
                                Spacer()
                                let count = group.subjects.filter { session.selectedSubjects.contains($0) }.count
                                if count > 0 {
                                    Text("\(count) selected")
                                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                                        .foregroundColor(group.stream.color.opacity(0.8))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 3)
                                        .background(group.stream.color.opacity(0.1))
                                        .cornerRadius(8)
                                }
                            }
                            .padding(.horizontal, 4)

                            Rectangle()
                                .fill(group.stream.color.opacity(0.25))
                                .frame(height: 1)

                            LazyVGrid(columns: columns, spacing: 12) {
                                ForEach(Array(group.subjects.enumerated()), id: \.element.id) { idx, subject in
                                    SubjectCard(
                                        subject: subject,
                                        isSelected: session.selectedSubjects.contains(subject),
                                        streamColor: group.stream.color,
                                        delay: Double(idx) * 0.04
                                    ) {
                                        withAnimation(.spring(response: 0.3)) {
                                            if session.selectedSubjects.contains(subject) {
                                                session.selectedSubjects.remove(subject)
                                            } else {
                                                session.selectedSubjects.insert(subject)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding(16)
                        .background(group.stream.color.opacity(0.04))
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(group.stream.color.opacity(0.12), lineWidth: 1)
                        )
                    }

                    Spacer().frame(height: 110)
                }
                .padding(.horizontal, 20)
            }
            .opacity(appeared ? 1 : 0)
            .animation(.easeOut.delay(0.2), value: appeared)
        }
        .overlay(alignment: .bottom) {
            VStack(spacing: 10) {
                if !session.selectedSubjects.isEmpty {
                    Text(
                        canContinue
                            ? "\(session.selectedSubjects.count) subjects selected ✓"
                            : "\(session.selectedSubjects.count) selected · need \(2 - session.selectedSubjects.count) more"
                    )
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundColor(canContinue ? .cyan : Theme.textSecondary)
                    .transition(.opacity)
                    .animation(.easeOut, value: session.selectedSubjects.count)
                }

                Button(action: { if canContinue { onContinue() } }) {
                    HStack(spacing: 10) {
                        Text("Next: Personality Quiz")
                        Image(systemName: "brain.head.profile")
                            .font(.system(size: 17))
                    }
                    .modifier(PrimaryButtonStyle(isDisabled: !canContinue))
                }
                .disabled(!canContinue)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 36)
            .padding(.top, 16)
            .background(
                LinearGradient(
                    colors: [Theme.background.opacity(0), Theme.background],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
            .opacity(appeared ? 1 : 0)
            .animation(.easeOut.delay(0.5), value: appeared)
        }
        .onAppear { appeared = true }
    }
}

// MARK: - Subject Card
struct SubjectCard: View {
    let subject: Subject
    let isSelected: Bool
    let streamColor: Color
    let delay: Double
    let action: () -> Void
    @State private var appeared = false

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Text(subject.emoji)
                    .font(.system(size: 26))
                Text(subject.rawValue)
                    .font(.system(size: 11, weight: .semibold, design: .rounded))
                    .foregroundColor(isSelected ? .black : Theme.textSecondary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.8)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(
                isSelected
                    ? LinearGradient(colors: [streamColor, streamColor.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    : LinearGradient(colors: [Color.white.opacity(0.07), Color.white.opacity(0.04)], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(isSelected ? Color.clear : streamColor.opacity(0.2), lineWidth: 1)
            )
            .scaleEffect(isSelected ? 1.04 : 1.0)
        }
        .buttonStyle(.plain)
        .animation(.spring(response: 0.3), value: isSelected)
        .scaleEffect(appeared ? 1 : 0.8)
        .opacity(appeared ? 1 : 0)
        .onAppear {
            withAnimation(.spring(response: 0.4).delay(delay)) {
                appeared = true
            }
        }
    }
}

// MARK: - Quiz Screen
struct QuizView: View {
    @ObservedObject var session: AppSession
    let onComplete: () -> Void
    @State private var currentIndex = 0
    @State private var selectedOption: UUID? = nil
    @State private var answeredQuestions: [(questionIndex: Int, optionID: UUID, traits: [PersonalityTrait: Int])] = []

    var question: QuizQuestion { quizQuestions[currentIndex] }
    var progress: Double { Double(currentIndex) / Double(quizQuestions.count) }

    var body: some View {
        VStack(spacing: 0) {
            // Top bar — fix: removed invisible duplicate spacer button
            VStack(spacing: 10) {
                HStack {
                    Button(action: goBack) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 14, weight: .semibold))
                            Text("Back")
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                        }
                        .foregroundColor(.cyan)
                        .opacity(currentIndex > 0 ? 1 : 0)
                    }
                    .disabled(currentIndex == 0)

                    Spacer()

                    Text("\(currentIndex + 1) / \(quizQuestions.count)")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(Theme.textPrimary)

                    Spacer()

                    // Invisible placeholder to keep title centred without a duplicate button
                    Text("Back")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(.clear)
                }

                AnimatedProgressBar(progress: progress)

                HStack(spacing: 7) {
                    ForEach(0..<quizQuestions.count, id: \.self) { i in
                        ZStack {
                            Circle()
                                .fill(i < currentIndex ? Color.cyan : (i == currentIndex ? Color.cyan : Color.white.opacity(0.15)))
                                .frame(width: i == currentIndex ? 10 : 7, height: i == currentIndex ? 10 : 7)
                            if i == currentIndex {
                                Circle()
                                    .stroke(Color.cyan.opacity(0.35), lineWidth: 2.5)
                                    .frame(width: 17, height: 17)
                            }
                        }
                        .animation(.spring(response: 0.3), value: currentIndex)
                    }
                }
            }
            .padding(.horizontal, 28)
            .padding(.top, 56)

            Spacer()

            VStack(spacing: 8) {
                Text(question.emoji)
                    .font(.system(size: 50))
                    .id("emoji_\(currentIndex)")
                    .transition(.scale.combined(with: .opacity))

                Text(question.text)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(Theme.textPrimary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 28)
                    .id("text_\(currentIndex)")
                    .transition(.opacity.combined(with: .offset(y: 20)))
            }
            .animation(.easeOut(duration: 0.3), value: currentIndex)

            Spacer().frame(height: 24)

            VStack(spacing: 12) {
                ForEach(Array(question.options.enumerated()), id: \.element.id) { idx, option in
                    QuizOptionButton(
                        option: option,
                        isSelected: selectedOption == option.id,
                        index: idx
                    ) {
                        guard selectedOption == nil else { return }
                        selectedOption = option.id

                        for (trait, score) in option.traits {
                            session.personalityScores[trait, default: 0] += score
                        }
                        answeredQuestions.append((currentIndex, option.id, option.traits))

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                if currentIndex < quizQuestions.count - 1 {
                                    currentIndex += 1
                                    selectedOption = nil
                                } else {
                                    onComplete()
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
            .id(currentIndex)
            .transition(.asymmetric(
                insertion: .opacity.combined(with: .offset(y: 30)),
                removal: .opacity
            ))
            .animation(.easeOut(duration: 0.3), value: currentIndex)

            Spacer()
        }
    }

    func goBack() {
        guard currentIndex > 0 else { return }
        if let last = answeredQuestions.last, last.questionIndex == currentIndex - 1 {
            for (trait, score) in last.traits {
                session.personalityScores[trait, default: 0] -= score
            }
            answeredQuestions.removeLast()
        }
        withAnimation(.easeInOut(duration: 0.3)) {
            currentIndex -= 1
            selectedOption = nil
        }
    }
}

// MARK: - Quiz Option Button
struct QuizOptionButton: View {
    let option: QuizOption
    let isSelected: Bool
    let index: Int
    let action: () -> Void
    @State private var appeared = false

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                ZStack {
                    Circle()
                        .fill(isSelected ? Color.cyan : Color.white.opacity(0.1))
                        .frame(width: 30, height: 30)
                    Text(["A", "B", "C", "D"][index])
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .foregroundColor(isSelected ? .black : Theme.textSecondary)
                }

                Text(option.text)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(Theme.textPrimary)
                    .multilineTextAlignment(.leading)

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.cyan)
                        .font(.system(size: 18))
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .padding(16)
            .background(
                isSelected
                    ? LinearGradient(colors: [Color.cyan.opacity(0.18), Color.purple.opacity(0.15)], startPoint: .leading, endPoint: .trailing)
                    : LinearGradient(colors: [Color.white.opacity(0.07), Color.white.opacity(0.04)], startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(isSelected ? Color.cyan.opacity(0.7) : Color.white.opacity(0.1), lineWidth: 1.5)
            )
            .scaleEffect(isSelected ? 1.02 : 1.0)
        }
        .buttonStyle(.plain)
        .animation(.spring(response: 0.3), value: isSelected)
        .scaleEffect(appeared ? 1 : 0.92)
        .opacity(appeared ? 1 : 0)
        .onAppear {
            withAnimation(.spring(response: 0.4).delay(Double(index) * 0.07)) {
                appeared = true
            }
        }
    }
}
