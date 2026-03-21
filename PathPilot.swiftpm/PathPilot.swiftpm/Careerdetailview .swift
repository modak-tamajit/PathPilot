import SwiftUI

// MARK: - Career Detail View
struct CareerDetailView: View {
    let career: Career
    @ObservedObject var session: AppSession
    let onBack: () -> Void
    @State private var appeared = false
    @State private var selectedTab = 0

    let tabs = ["Roadmap", "College", "Skills"]

    var body: some View {
        VStack(spacing: 0) {
            // Navigation Bar
            HStack {
                NavBackButton(label: "Results", action: onBack)
                Spacer()
                Button(action: {
                    if session.bookmarkedCareers.contains(career.title) {
                        session.bookmarkedCareers.remove(career.title)
                    } else {
                        session.bookmarkedCareers.insert(career.title)
                    }
                }) {
                    Image(systemName: session.bookmarkedCareers.contains(career.title) ? "bookmark.fill" : "bookmark")
                        .font(.system(size: 18))
                        .foregroundColor(session.bookmarkedCareers.contains(career.title) ? .yellow : Theme.textSecondary)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 56)

            ScrollView(showsIndicators: false) {
                VStack(spacing: 22) {

                    // Hero
                    VStack(spacing: 12) {
                        Text(career.emoji)
                            .font(.system(size: 70))
                            .scaleEffect(appeared ? 1 : 0.3)
                            .animation(.spring(response: 0.5).delay(0.1), value: appeared)

                        Text(career.title)
                            .font(.system(size: 28, weight: .heavy, design: .rounded))
                            .foregroundStyle(Theme.gradientHero)
                            .opacity(appeared ? 1 : 0)
                            .animation(.easeOut.delay(0.2), value: appeared)

                        Text(career.description)
                            .font(.system(size: 15, design: .rounded))
                            .foregroundColor(Theme.textSecondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .opacity(appeared ? 1 : 0)
                            .animation(.easeOut.delay(0.3), value: appeared)

                        // Fix: salary now shown prominently in hero alongside timeline
                        HStack(spacing: 10) {
                            HStack(spacing: 6) {
                                Image(systemName: "clock.fill")
                                    .foregroundColor(.cyan)
                                Text(career.timeline)
                                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                                    .foregroundColor(.cyan)
                            }
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(Color.cyan.opacity(0.1))
                            .cornerRadius(20)

                            HStack(spacing: 6) {
                                Image(systemName: "indianrupeesign.circle.fill")
                                    .foregroundColor(.green)
                                Text(career.salaryRange)
                                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                                    .foregroundColor(.green)
                            }
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(20)
                        }
                        .opacity(appeared ? 1 : 0)
                        .animation(.easeOut.delay(0.35), value: appeared)
                    }
                    .padding(.top, 16)

                    // Tab Selector
                    HStack(spacing: 0) {
                        ForEach(Array(tabs.enumerated()), id: \.offset) { idx, tab in
                            Button(action: { withAnimation(.spring(response: 0.3)) { selectedTab = idx } }) {
                                Text(tab)
                                    .font(.system(size: 14, weight: selectedTab == idx ? .bold : .medium, design: .rounded))
                                    .foregroundColor(selectedTab == idx ? .black : Theme.textSecondary)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .background(
                                        selectedTab == idx
                                            ? Theme.gradientAccent
                                            : LinearGradient(colors: [Color.clear], startPoint: .leading, endPoint: .trailing)
                                    )
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(4)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(13)
                    .padding(.horizontal, 24)
                    .opacity(appeared ? 1 : 0)
                    .animation(.easeOut.delay(0.4), value: appeared)

                    // Tab Content
                    Group {
                        switch selectedTab {
                        case 0: RoadmapTabView(career: career, session: session)
                        case 1: CollegeTabView(career: career)
                        case 2: SkillsTabView(career: career, session: session)
                        default: EmptyView()
                        }
                    }
                    .padding(.horizontal, 24)
                    .opacity(appeared ? 1 : 0)
                    .animation(.easeOut.delay(0.5), value: appeared)

                    Spacer().frame(height: 40)
                }
            }
        }
        .onAppear { appeared = true }
    }
}

// MARK: - Roadmap Tab
struct RoadmapTabView: View {
    let career: Career
    @ObservedObject var session: AppSession

    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(career.roadmap) { step in
                    HStack(alignment: .top, spacing: 14) {
                        VStack(spacing: 0) {
                            ZStack {
                                Circle()
                                    .fill(step.level.color.opacity(0.2))
                                    .frame(width: 32, height: 32)
                                Text("\(step.step)")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .foregroundColor(step.level.color)
                            }
                            if step.step < career.roadmap.count {
                                Rectangle()
                                    .fill(Color.white.opacity(0.08))
                                    .frame(width: 2)
                                    .frame(maxHeight: 44)
                            }
                        }

                        VStack(alignment: .leading, spacing: 5) {
                            HStack(spacing: 8) {
                                Text(step.title)
                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                    .foregroundColor(Theme.textPrimary)
                                Text(step.level.rawValue)
                                    .font(.system(size: 10, weight: .bold, design: .rounded))
                                    .foregroundColor(step.level.color)
                                    .padding(.horizontal, 7)
                                    .padding(.vertical, 3)
                                    .background(step.level.color.opacity(0.15))
                                    .cornerRadius(6)
                            }
                            Text(step.description)
                                .font(.system(size: 13, design: .rounded))
                                .foregroundColor(Theme.textSecondary)
                        }
                        .padding(.bottom, 20)
                    }
                }
            }
            .padding(18)
            .glassCard()

            VStack(alignment: .leading, spacing: 12) {
                Text("📺 Where to Learn")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(Theme.textPrimary)

                ForEach(career.platforms, id: \.self) { platform in
                    HStack(spacing: 10) {
                        Image(systemName: "play.circle.fill")
                            .foregroundColor(.cyan.opacity(0.7))
                            .font(.system(size: 14))
                        Text(platform)
                            .font(.system(size: 13, design: .rounded))
                            .foregroundColor(Theme.textSecondary)
                        Spacer()
                    }
                }
            }
            .padding(18)
            .glassCard()
        }
    }
}

// MARK: - College Tab
struct CollegeTabView: View {
    let career: Career

    var body: some View {
        VStack(spacing: 14) {
            VStack(alignment: .leading, spacing: 12) {
                Text("🎓 Recommended Colleges")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(Theme.textPrimary)

                ForEach(career.collegeTypes, id: \.self) { college in
                    HStack(spacing: 10) {
                        Image(systemName: "building.columns.fill")
                            .foregroundColor(.purple.opacity(0.7))
                            .font(.system(size: 13))
                        Text(college)
                            .font(.system(size: 13, design: .rounded))
                            .foregroundColor(Theme.textSecondary)
                        Spacer()
                    }
                }
            }
            .padding(18)
            .glassCard()

            VStack(alignment: .leading, spacing: 12) {
                Text("📝 Entrance Exams")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(Theme.textPrimary)

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(career.entranceExams, id: \.self) { exam in
                        Text(exam)
                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                            .foregroundColor(.cyan)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color.cyan.opacity(0.08))
                            .cornerRadius(10)
                    }
                }
            }
            .padding(18)
            .glassCard()

            VStack(alignment: .leading, spacing: 10) {
                Text("🏅 Scholarship Tips")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(Theme.textPrimary)

                Text(career.scholarshipTip)
                    .font(.system(size: 13, design: .rounded))
                    .foregroundColor(Theme.textSecondary)
                    .lineSpacing(4)
            }
            .padding(18)
            .glassCard()
        }
    }
}

// MARK: - Skills Tab
struct SkillsTabView: View {
    let career: Career
    @ObservedObject var session: AppSession

    var body: some View {
        VStack(spacing: 14) {
            VStack(alignment: .leading, spacing: 14) {
                Text("🛠️ Key Skills to Master")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(Theme.textPrimary)

                Text("Tap to track your learning progress")
                    .font(.system(size: 12, design: .rounded))
                    .foregroundColor(Theme.textTertiary)

                ForEach(career.skills, id: \.self) { skill in
                    let status = session.skillProgress[skill] ?? .notStarted
                    Button(action: {
                        withAnimation(.spring(response: 0.3)) {
                            let allCases = SkillStatus.allCases
                            let currentIndex = allCases.firstIndex(of: status) ?? 0
                            session.skillProgress[skill] = allCases[(currentIndex + 1) % allCases.count]
                        }
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: status.icon)
                                .foregroundColor(status.color)
                                .font(.system(size: 18))

                            Text(skill)
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .foregroundColor(Theme.textPrimary)

                            Spacer()

                            Text(status.rawValue)
                                .font(.system(size: 11, weight: .semibold, design: .rounded))
                                .foregroundColor(status.color)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(status.color.opacity(0.12))
                                .cornerRadius(8)
                        }
                        .padding(14)
                        .glassCard(opacity: 0.07, cornerRadius: 12)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(18)
            .glassCard()
        }
    }
}
