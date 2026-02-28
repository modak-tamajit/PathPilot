import SwiftUI

// MARK: - Design System
struct Theme {
    static let background = Color(red: 0.04, green: 0.04, blue: 0.12)
    static let surface = Color(red: 0.09, green: 0.09, blue: 0.20)
    static let surfaceLight = Color(red: 0.13, green: 0.13, blue: 0.26)
    static let accent = Color.cyan
    static let accentSecondary = Color.purple
    static let accentTertiary = Color.pink
    static let textPrimary = Color.white
    static let textSecondary = Color.white.opacity(0.65)
    static let textTertiary = Color.white.opacity(0.35)

    static let gradientMain = LinearGradient(
        colors: [Color(red: 0.04, green: 0.04, blue: 0.12), Color(red: 0.08, green: 0.04, blue: 0.20)],
        startPoint: .topLeading, endPoint: .bottomTrailing
    )
    static let gradientAccent = LinearGradient(
        colors: [.cyan, .purple], startPoint: .leading, endPoint: .trailing
    )
    static let gradientHero = LinearGradient(
        colors: [.cyan, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing
    )
}

// MARK: - Shared Card Modifier
struct GlassCard: ViewModifier {
    var opacity: Double = 0.07
    var cornerRadius: CGFloat = 18
    var borderOpacity: Double = 0.12

    func body(content: Content) -> some View {
        content
            .background(Color.white.opacity(opacity))
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.white.opacity(borderOpacity), lineWidth: 1)
            )
    }
}

extension View {
    func glassCard(opacity: Double = 0.07, cornerRadius: CGFloat = 18, borderOpacity: Double = 0.12) -> some View {
        self.modifier(GlassCard(opacity: opacity, cornerRadius: cornerRadius, borderOpacity: borderOpacity))
    }
}

// MARK: - Shared Button Style
struct PrimaryButtonStyle: ViewModifier {
    var isDisabled: Bool = false
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .bold, design: .rounded))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
            .background(
                Theme.gradientAccent
                    .opacity(isDisabled ? 0.4 : 1)
            )
            .cornerRadius(16)
    }
}

// MARK: - Stars Background
struct StarsView: View {
    struct Star {
        let x: CGFloat
        let y: CGFloat
        let size: CGFloat
        let opacity: Double
    }

    let stars: [Star] = (0..<100).map { _ in
        Star(
            x: CGFloat.random(in: 0...1),
            y: CGFloat.random(in: 0...1),
            size: CGFloat.random(in: 1...3),
            opacity: Double.random(in: 0.2...0.7)
        )
    }

    var body: some View {
        GeometryReader { geo in
            ForEach(0..<stars.count, id: \.self) { i in
                Circle()
                    .fill(Color.white.opacity(stars[i].opacity))
                    .frame(width: stars[i].size, height: stars[i].size)
                    .position(
                        x: stars[i].x * geo.size.width,
                        y: stars[i].y * geo.size.height
                    )
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - Animated Progress Bar
struct AnimatedProgressBar: View {
    let progress: Double
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.white.opacity(0.1))
                    .frame(height: 6)
                RoundedRectangle(cornerRadius: 4)
                    .fill(Theme.gradientAccent)
                    .frame(width: max(0, geo.size.width * progress), height: 6)
                    .animation(.spring(response: 0.5), value: progress)
            }
        }
        .frame(height: 6)
    }
}

// MARK: - Personality Bar Chart View
struct PersonalityChartView: View {
    let scores: [PersonalityTrait: Int]

    var maxScore: Int {
        max(scores.values.max() ?? 1, 1)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("📊 Your Personality Profile")
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(Theme.textPrimary)

            ForEach(PersonalityTrait.allCases, id: \.self) { trait in
                let score = scores[trait] ?? 0
                let ratio = Double(score) / Double(maxScore)

                HStack(spacing: 12) {
                    Text(trait.emoji)
                        .font(.system(size: 14))
                        .frame(width: 22)

                    Text(trait.rawValue)
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(Theme.textSecondary)
                        .frame(width: 120, alignment: .leading)

                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.white.opacity(0.08))
                            RoundedRectangle(cornerRadius: 4)
                                .fill(trait.color.opacity(0.85))
                                .frame(width: geo.size.width * ratio)
                                .animation(.spring(response: 0.6).delay(Double(PersonalityTrait.allCases.firstIndex(of: trait) ?? 0) * 0.08), value: ratio)
                        }
                    }
                    .frame(height: 10)

                    Text("\(score)")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(trait.color)
                        .frame(width: 24, alignment: .trailing)
                }
            }
        }
        .padding(20)
        .glassCard()
    }
}
