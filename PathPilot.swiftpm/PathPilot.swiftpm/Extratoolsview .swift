import SwiftUI

// MARK: - Extra Tools Hub
struct ExtraToolsView: View {
    @ObservedObject var session: AppSession
    let onBack: () -> Void
    @State private var activeTab = 0
    @State private var appeared = false

    let tabs = ["Goals", "30-Day Plan", "Compare", "Profile"]

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                NavBackButton(label: "Results", action: onBack)
                Spacer()
                Text("Extra Tools")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(Theme.textPrimary)
                Spacer()
                // Invisible balance element
                Text("Results")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(.clear)
            }
            .padding(.horizontal, 24)
            .padding(.top, 56)
            .padding(.bottom, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(Array(tabs.enumerated()), id: \.offset) { idx, tab in
                        Button(action: { withAnimation(.spring(response: 0.3)) { activeTab = idx } }) {
                            Text(tab)
                                .font(.system(size: 14, weight: activeTab == idx ? .bold : .medium, design: .rounded))
                                .foregroundColor(activeTab == idx ? .black : Theme.textSecondary)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 9)
                                .background(
                                    activeTab == idx
                                        ? Theme.gradientAccent
                                        : LinearGradient(colors: [Color.white.opacity(0.08)], startPoint: .leading, endPoint: .trailing)
                                )
                                .cornerRadius(20)
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
            .padding(.bottom, 14)

            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    switch activeTab {
                    case 0: GoalTrackerView(session: session)
                    case 1: ThirtyDayPlanView(session: session)
                    case 2: CareerComparisonView(session: session)
                    case 3: PersonalityProfileView(session: session)
                    default: EmptyView()
                    }
                    Spacer().frame(height: 40)
                }
                .padding(.horizontal, 24)
            }
        }
        .onAppear { appeared = true }
    }
}

// MARK: - Goal Tracker
struct GoalTrackerView: View {
    @ObservedObject var session: AppSession
    @State private var newGoalText = ""

    var completedCount: Int { session.goals.filter { $0.isCompleted }.count }
    var progress: Double { session.goals.isEmpty ? 0 : Double(completedCount) / Double(session.goals.count) }

    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                HStack {
                    Text("🎯 Goal Tracker")
                        .font(.system(size: 17, weight: .bold, design: .rounded))
                        .foregroundColor(Theme.textPrimary)
                    Spacer()
                    Text("\(completedCount)/\(session.goals.count)")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(.cyan)
                }
                AnimatedProgressBar(progress: progress)
                Text("\(Int(progress * 100))% complete")
                    .font(.system(size: 12, design: .rounded))
                    .foregroundColor(Theme.textSecondary)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(18)
            .glassCard()

            ForEach($session.goals) { $goal in
                Button(action: {
                    withAnimation(.spring(response: 0.3)) {
                        goal.isCompleted.toggle()
                    }
                }) {
                    HStack(spacing: 12) {
                        Image(systemName: goal.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(goal.isCompleted ? .green : Theme.textTertiary)
                            .font(.system(size: 20))

                        Text(goal.title)
                            .font(.system(size: 13, design: .rounded))
                            .foregroundColor(goal.isCompleted ? Theme.textTertiary : Theme.textPrimary)
                            .strikethrough(goal.isCompleted)
                            .multilineTextAlignment(.leading)

                        Spacer()
                    }
                    .padding(14)
                    .glassCard(opacity: goal.isCompleted ? 0.03 : 0.07, cornerRadius: 12)
                }
                .buttonStyle(.plain)
            }

            VStack(spacing: 10) {
                Text("Add Your Own Goal")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundColor(Theme.textSecondary)
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 10) {
                    TextField("Type a goal...", text: $newGoalText)
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(Theme.textPrimary)
                        .padding(12)
                        .background(Color.white.opacity(0.07))
                        .cornerRadius(10)
                        .tint(.cyan)
                        .submitLabel(.done)
                        .onSubmit {
                            addGoal()
                        }

                    Button(action: addGoal) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 28))
                            .foregroundColor(.cyan)
                    }
                }
            }
            .padding(18)
            .glassCard()
        }
    }

    private func addGoal() {
        guard !newGoalText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        withAnimation { session.goals.append(GoalItem(title: newGoalText)) }
        newGoalText = ""
    }
}

// MARK: - 30 Day Plan
struct ThirtyDayPlanView: View {
    @ObservedObject var session: AppSession

    var body: some View {
        VStack(spacing: 14) {
            if let career = session.primaryCareers.first {
                VStack(alignment: .leading, spacing: 10) {
                    Text("📅 30-Day Starter Plan")
                        .font(.system(size: 17, weight: .bold, design: .rounded))
                        .foregroundColor(Theme.textPrimary)
                    Text("For: \(career.emoji) \(career.title)")
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(.cyan)
                    Text("Check off tasks as you complete them")
                        .font(.system(size: 12, design: .rounded))
                        .foregroundColor(Theme.textTertiary)
                }
                .padding(18)
                .glassCard()

                ForEach($session.goals) { $goal in
                    Button(action: {
                        withAnimation(.spring(response: 0.3)) { goal.isCompleted.toggle() }
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: goal.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(goal.isCompleted ? .green : Theme.textTertiary)
                                .font(.system(size: 18))
                            Text(goal.title)
                                .font(.system(size: 12, design: .rounded))
                                .foregroundColor(goal.isCompleted ? Theme.textTertiary : Theme.textSecondary)
                                .strikethrough(goal.isCompleted)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .padding(14)
                        .glassCard(opacity: goal.isCompleted ? 0.03 : 0.07, cornerRadius: 12)
                    }
                    .buttonStyle(.plain)
                }
            } else {
                VStack(spacing: 12) {
                    Text("📋")
                        .font(.system(size: 40))
                    Text("Complete the quiz to generate your plan!")
                        .foregroundColor(Theme.textSecondary)
                        .font(.system(size: 14, design: .rounded))
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding(32)
                .glassCard()
            }
        }
    }
}

// MARK: - Career Comparison
// Fix: removed double-nested glassCard — outer container no longer wraps already-carded items
struct CareerComparisonView: View {
    @ObservedObject var session: AppSession

    var body: some View {
        VStack(spacing: 14) {
            HStack {
                Text("🧩 Career Comparison")
                    .font(.system(size: 17, weight: .bold, design: .rounded))
                    .foregroundColor(Theme.textPrimary)
                Spacer()
                Text("\(session.primaryCareers.count + session.alternateCareers.count) careers")
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .foregroundColor(Theme.textTertiary)
            }

            let allCareers = session.primaryCareers + session.alternateCareers

            if allCareers.isEmpty {
                VStack(spacing: 12) {
                    Text("🔍")
                        .font(.system(size: 40))
                    Text("No careers to compare yet.\nComplete the quiz first.")
                        .foregroundColor(Theme.textSecondary)
                        .font(.system(size: 14, design: .rounded))
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding(32)
                .glassCard()
            } else {
                ForEach(allCareers) { career in
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text(career.emoji + " " + career.title)
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .foregroundColor(Theme.textPrimary)
                            Spacer()
                            if session.bookmarkedCareers.contains(career.title) {
                                Image(systemName: "bookmark.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 13))
                            }
                        }

                        HStack(spacing: 8) {
                            CompareTag(icon: "clock", text: career.timeline, color: .cyan)
                            CompareTag(icon: "banknote", text: career.salaryRange, color: .green)
                        }

                        HStack(spacing: 6) {
                            ForEach(career.skills.prefix(3), id: \.self) { skill in
                                Text(skill)
                                    .font(.system(size: 10, weight: .semibold, design: .rounded))
                                    .foregroundColor(Theme.textSecondary)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.white.opacity(0.07))
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding(16)
                    .glassCard(opacity: 0.08, cornerRadius: 14)
                }
            }
        }
    }
}

struct CompareTag: View {
    let icon: String
    let text: String
    let color: Color
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: icon)
                .font(.system(size: 10))
            Text(text)
                .font(.system(size: 11, weight: .medium, design: .rounded))
        }
        .foregroundColor(color)
        .padding(.horizontal, 8)
        .padding(.vertical, 5)
        .background(color.opacity(0.1))
        .cornerRadius(8)
    }
}

// MARK: - Personality Profile View
struct PersonalityProfileView: View {
    @ObservedObject var session: AppSession

    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 10) {
                Text(session.topTrait.emoji)
                    .font(.system(size: 52))
                Text("You are \(session.topTrait.rawValue)")
                    .font(.system(size: 22, weight: .heavy, design: .rounded))
                    .foregroundStyle(Theme.gradientHero)
                Text(session.topTrait.description)
                    .font(.system(size: 14, design: .rounded))
                    .foregroundColor(Theme.textSecondary)
                    .multilineTextAlignment(.center)
            }
            .padding(20)
            .glassCard()

            PersonalityChartView(scores: session.personalityScores)

            VStack(alignment: .leading, spacing: 12) {
                Text("All Personality Traits")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(Theme.textPrimary)

                ForEach(PersonalityTrait.allCases, id: \.self) { trait in
                    HStack(spacing: 12) {
                        Text(trait.emoji + " " + trait.rawValue)
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundColor(Theme.textSecondary)
                            .frame(width: 160, alignment: .leading)
                        Spacer()
                        Text("\(session.personalityScores[trait] ?? 0) pts")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .foregroundColor(trait.color)
                    }
                }
            }
            .padding(18)
            .glassCard()

            if !session.motivationalQuote.isEmpty {
                VStack(spacing: 8) {
                    Text("✨ Your Motivation")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(Theme.textPrimary)
                    Text(session.motivationalQuote)
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(.cyan.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                }
                .padding(18)
                .glassCard()
            }
        }
    }
}
