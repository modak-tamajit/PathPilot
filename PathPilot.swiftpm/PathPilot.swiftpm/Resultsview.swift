import SwiftUI

// MARK: - Results Screen
struct ResultsView: View {
    @ObservedObject var session: AppSession
    let onCareerDetail: (Career) -> Void
    let onExtraTools: () -> Void
    let onReset: () -> Void
    @State private var appeared = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                Spacer().frame(height: 54)

                // Congrats Header
                VStack(spacing: 10) {
                    Text("🎉")
                        .font(.system(size: 52))
                        .scaleEffect(appeared ? 1 : 0.2)
                        .animation(.spring(response: 0.5, dampingFraction: 0.45).delay(0.1), value: appeared)

                    Text("\(session.userName), here's your path!")
                        .font(.system(size: 26, weight: .heavy, design: .rounded))
                        .foregroundStyle(Theme.gradientHero)
                        .multilineTextAlignment(.center)
                        .opacity(appeared ? 1 : 0)
                        .animation(.easeOut.delay(0.25), value: appeared)

                    Text("Based on your interests and personality")
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(Theme.textSecondary)
                        .opacity(appeared ? 1 : 0)
                        .animation(.easeOut.delay(0.35), value: appeared)
                }
                .padding(.horizontal, 24)

                // Personality Summary
                VStack(spacing: 10) {
                    HStack(spacing: 10) {
                        Text(session.topTrait.emoji)
                            .font(.system(size: 22))
                        VStack(alignment: .leading, spacing: 2) {
                            Text("You are primarily \(session.topTrait.rawValue)")
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .foregroundColor(Theme.textPrimary)
                            Text(session.topTrait.description)
                                .font(.system(size: 13, design: .rounded))
                                .foregroundColor(Theme.textSecondary)
                        }
                    }
                    .padding(16)
                    .glassCard(opacity: 0.1, cornerRadius: 14)

                    // Motivational quote
                    Text("💬 \"\(session.motivationalQuote)\"")
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(.cyan.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .padding(14)
                        .glassCard(opacity: 0.06, cornerRadius: 12)
                }
                .padding(.horizontal, 24)
                .opacity(appeared ? 1 : 0)
                .animation(.easeOut.delay(0.45), value: appeared)

                // Primary Careers
                VStack(alignment: .leading, spacing: 14) {
                    SectionHeader(emoji: "🏆", title: "Top Career Matches")

                    ForEach(Array(session.primaryCareers.enumerated()), id: \.element.id) { idx, career in
                        CareerCard(
                            career: career,
                            rank: idx + 1,
                            isPrimary: true,
                            isBookmarked: session.bookmarkedCareers.contains(career.title),
                            delay: Double(idx) * 0.1
                        ) {
                            onCareerDetail(career)
                        } onBookmark: {
                            if session.bookmarkedCareers.contains(career.title) {
                                session.bookmarkedCareers.remove(career.title)
                            } else {
                                session.bookmarkedCareers.insert(career.title)
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
                .opacity(appeared ? 1 : 0)
                .animation(.easeOut.delay(0.5), value: appeared)

                // Alternate Careers
                VStack(alignment: .leading, spacing: 14) {
                    SectionHeader(emoji: "🔄", title: "Also Worth Exploring")

                    ForEach(Array(session.alternateCareers.enumerated()), id: \.element.id) { idx, career in
                        CareerCard(
                            career: career,
                            rank: nil,
                            isPrimary: false,
                            isBookmarked: session.bookmarkedCareers.contains(career.title),
                            delay: Double(idx) * 0.08
                        ) {
                            onCareerDetail(career)
                        } onBookmark: {
                            if session.bookmarkedCareers.contains(career.title) {
                                session.bookmarkedCareers.remove(career.title)
                            } else {
                                session.bookmarkedCareers.insert(career.title)
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
                .opacity(appeared ? 1 : 0)
                .animation(.easeOut.delay(0.65), value: appeared)

                // Personality Chart
                PersonalityChartView(scores: session.personalityScores)
                    .padding(.horizontal, 24)
                    .opacity(appeared ? 1 : 0)
                    .animation(.easeOut.delay(0.75), value: appeared)

                // Extra Tools Button
                Button(action: onExtraTools) {
                    HStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(LinearGradient(colors: [.cyan.opacity(0.25), .purple.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 42, height: 42)
                            Image(systemName: "square.grid.2x2.fill")
                                .font(.system(size: 17))
                                .foregroundStyle(Theme.gradientAccent)
                        }
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Explore Extra Tools")
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .foregroundColor(Theme.textPrimary)
                            Text("Skill tracker · 30-day plan · Goals · Profile")
                                .font(.system(size: 12, design: .rounded))
                                .foregroundColor(Theme.textSecondary)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.cyan.opacity(0.6))
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .padding(16)
                    .background(LinearGradient(colors: [Color.cyan.opacity(0.07), Color.purple.opacity(0.05)], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.cyan.opacity(0.18), lineWidth: 1))
                }
                .padding(.horizontal, 24)
                .opacity(appeared ? 1 : 0)
                .animation(.easeOut.delay(0.85), value: appeared)

                // Closing encouragement card
                VStack(spacing: 14) {
                    Text("🌟")
                        .font(.system(size: 36))
                    Text("Your journey starts now")
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                        .foregroundStyle(Theme.gradientHero)
                    Text("Every expert was once a beginner. The path you've been shown is real — the only step left is your first one.")
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(Theme.textSecondary)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                        .padding(.horizontal, 8)

                    // Bookmarked careers summary
                    if !session.bookmarkedCareers.isEmpty {
                        HStack(spacing: 6) {
                            Image(systemName: "bookmark.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 12))
                            Text("\(session.bookmarkedCareers.count) career\(session.bookmarkedCareers.count == 1 ? "" : "s") bookmarked")
                                .font(.system(size: 12, weight: .semibold, design: .rounded))
                                .foregroundColor(.yellow.opacity(0.9))
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(Color.yellow.opacity(0.1))
                        .cornerRadius(20)
                    }
                }
                .padding(24)
                .glassCard(opacity: 0.08, cornerRadius: 20)
                .padding(.horizontal, 24)
                .opacity(appeared ? 1 : 0)
                .animation(.easeOut.delay(0.92), value: appeared)

                // Reset — subtle, not alarming
                Button(action: onReset) {
                    HStack(spacing: 8) {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.system(size: 13))
                        Text("Start over with different interests")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                    }
                    .foregroundColor(Theme.textTertiary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.white.opacity(0.04))
                    .cornerRadius(14)
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.white.opacity(0.07), lineWidth: 1))
                }
                .padding(.horizontal, 24)
                .opacity(appeared ? 1 : 0)
                .animation(.easeOut.delay(0.97), value: appeared)

                Spacer().frame(height: 40)
            }
        }
        .onAppear { appeared = true }
    }
}

// MARK: - Career Card
struct CareerCard: View {
    let career: Career
    let rank: Int?
    let isPrimary: Bool
    let isBookmarked: Bool
    let delay: Double
    let onTap: () -> Void
    let onBookmark: () -> Void
    @State private var appeared = false

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 14) {
                // Rank + Emoji
                VStack(spacing: 4) {
                    Text(career.emoji)
                        .font(.system(size: isPrimary ? 34 : 28))
                    if let rank = rank {
                        Text("#\(rank)")
                            .font(.system(size: 11, weight: .bold, design: .rounded))
                            .foregroundColor(.cyan)
                    }
                }
                .frame(width: 50)

                // Info
                VStack(alignment: .leading, spacing: 5) {
                    Text(career.title)
                        .font(.system(size: isPrimary ? 16 : 15, weight: .bold, design: .rounded))
                        .foregroundColor(Theme.textPrimary)

                    Text(career.description)
                        .font(.system(size: 12, design: .rounded))
                        .foregroundColor(Theme.textSecondary)
                        .lineLimit(2)

                    HStack(spacing: 6) {
                        Image(systemName: "clock")
                            .font(.system(size: 11))
                            .foregroundColor(.cyan.opacity(0.7))
                        Text(career.timeline)
                            .font(.system(size: 11, weight: .medium, design: .rounded))
                            .foregroundColor(.cyan.opacity(0.7))
                    }

                    HStack(spacing: 6) {
                        Image(systemName: "banknote")
                            .font(.system(size: 11))
                            .foregroundColor(.green.opacity(0.8))
                        Text(career.salaryRange)
                            .font(.system(size: 11, weight: .medium, design: .rounded))
                            .foregroundColor(.green.opacity(0.8))
                    }
                }

                Spacer()

                VStack(spacing: 10) {
                    // Bookmark
                    Button(action: onBookmark) {
                        Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 16))
                            .foregroundColor(isBookmarked ? .yellow : Theme.textTertiary)
                    }

                    Image(systemName: "chevron.right")
                        .font(.system(size: 13))
                        .foregroundColor(Theme.textTertiary)
                }
            }
            .padding(16)
            .background(
                isPrimary
                    ? LinearGradient(colors: [Color.cyan.opacity(0.08), Color.purple.opacity(0.06)], startPoint: .leading, endPoint: .trailing)
                    : LinearGradient(colors: [Color.white.opacity(0.06), Color.white.opacity(0.03)], startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isPrimary ? Color.cyan.opacity(0.2) : Color.white.opacity(0.08), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
        .scaleEffect(appeared ? 1 : 0.94)
        .opacity(appeared ? 1 : 0)
        .onAppear {
            withAnimation(.spring(response: 0.4).delay(delay)) {
                appeared = true
            }
        }
    }
}

// MARK: - Section Header
struct SectionHeader: View {
    let emoji: String
    let title: String
    var body: some View {
        HStack(spacing: 8) {
            Text(emoji)
            Text(title)
                .font(.system(size: 17, weight: .bold, design: .rounded))
                .foregroundColor(Theme.textPrimary)
        }
    }
}
