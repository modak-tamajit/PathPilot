import SwiftUI

// MARK: - Personality Types
enum PersonalityTrait: String, CaseIterable {
    case analytical = "Analytical"
    case creative = "Creative"
    case social = "Social"
    case leadership = "Leadership"
    case practical = "Practical"
    case research = "Research-Oriented"

    var emoji: String {
        switch self {
        case .analytical: return "🔍"
        case .creative: return "🎨"
        case .social: return "🤝"
        case .leadership: return "🚀"
        case .practical: return "🔧"
        case .research: return "🔬"
        }
    }

    var color: Color {
        switch self {
        case .analytical: return .blue
        case .creative: return .purple
        case .social: return .orange
        case .leadership: return .red
        case .practical: return .green
        case .research: return .cyan
        }
    }

    var description: String {
        switch self {
        case .analytical: return "You break problems into pieces and think in logic and systems."
        case .creative: return "You see beauty, possibilities, and novel solutions others miss."
        case .social: return "You thrive with people, empathy is your superpower."
        case .leadership: return "You naturally guide, inspire, and take charge."
        case .practical: return "You build, execute, and get things done."
        case .research: return "You dig deep, question everything, and seek truth."
        }
    }
}

// MARK: - Subject Stream Category
enum SubjectStream: String, CaseIterable {
    case science = "Science Stream"
    case commerce = "Commerce Stream"
    case arts = "Arts & Humanities Stream"

    var emoji: String {
        switch self {
        case .science: return "🔬"
        case .commerce: return "💼"
        case .arts: return "🎭"
        }
    }

    var color: Color {
        switch self {
        case .science: return .cyan
        case .commerce: return .green
        case .arts: return .purple
        }
    }
}

// MARK: - Subject Areas (Indian Syllabus)
enum Subject: String, CaseIterable, Identifiable {
    var id: String { rawValue }

    case physics = "Physics"
    case chemistry = "Chemistry"
    case biology = "Biology"
    case mathematics = "Mathematics"
    case computerScience = "Computer Science"
    case zoology = "Zoology"
    case psychology = "Psychology"

    case accountancy = "Accountancy"
    case businessStudies = "Business Studies"
    case economics = "Economics"
    case statistics = "Statistics"
    case entrepreneurship = "Entrepreneurship"

    case history = "History"
    case geography = "Geography"
    case politicalScience = "Political Science"
    case sociology = "Sociology"
    case philosophy = "Philosophy"
    case hindi = "Hindi"
    case englishLiterature = "English Literature"

    var emoji: String {
        switch self {
        case .physics: return "⚛️"
        case .chemistry: return "🧪"
        case .biology: return "🧬"
        case .mathematics: return "📐"
        case .computerScience: return "💻"
        case .zoology: return "🦁"
        case .psychology: return "🧠"
        case .accountancy: return "🧾"
        case .businessStudies: return "📊"
        case .economics: return "💹"
        case .statistics: return "📉"
        case .entrepreneurship: return "🚀"
        case .history: return "🏛️"
        case .geography: return "🌍"
        case .politicalScience: return "⚖️"
        case .sociology: return "🤝"
        case .philosophy: return "💭"
        case .hindi: return "🇮🇳"
        case .englishLiterature: return "📚"
        }
    }

    var stream: SubjectStream {
        switch self {
        case .physics, .chemistry, .biology, .mathematics, .computerScience, .zoology, .psychology:
            return .science
        case .accountancy, .businessStudies, .economics, .statistics, .entrepreneurship:
            return .commerce
        case .history, .geography, .politicalScience, .sociology, .philosophy, .hindi, .englishLiterature:
            return .arts
        }
    }

    static var byStream: [(stream: SubjectStream, subjects: [Subject])] {
        SubjectStream.allCases.map { stream in
            (stream: stream, subjects: Subject.allCases.filter { $0.stream == stream })
        }
    }
}

// MARK: - Quiz Question
struct QuizQuestion: Identifiable {
    let id = UUID()
    let text: String
    let emoji: String
    let options: [QuizOption]
}

struct QuizOption: Identifiable {
    let id = UUID()
    let text: String
    let traits: [PersonalityTrait: Int]
}

// MARK: - Career
struct Career: Identifiable {
    let id = UUID()
    let title: String
    let emoji: String
    let description: String
    let requiredSubjects: [Subject]
    let requiredTraits: [PersonalityTrait]
    let skills: [String]
    let roadmap: [RoadmapStep]
    let platforms: [String]
    let timeline: String
    let salaryRange: String
    let collegeTypes: [String]
    let entranceExams: [String]
    let scholarshipTip: String
    var isBookmarked: Bool = false
}

struct RoadmapStep: Identifiable {
    let id = UUID()
    let step: Int
    let title: String
    let description: String
    let level: SkillLevel
}

enum SkillLevel: String {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"

    var color: Color {
        switch self {
        case .beginner: return .green
        case .intermediate: return .orange
        case .advanced: return .red
        }
    }
}

// MARK: - App Session (Observable State)
class AppSession: ObservableObject {
    @Published var userName: String = ""
    @Published var selectedSubjects: Set<Subject> = []
    @Published var personalityScores: [PersonalityTrait: Int] = Dictionary(
        uniqueKeysWithValues: PersonalityTrait.allCases.map { ($0, 0) }
    )
    @Published var primaryCareers: [Career] = []
    @Published var alternateCareers: [Career] = []
    @Published var bookmarkedCareers: Set<String> = []
    @Published var skillProgress: [String: SkillStatus] = [:]
    @Published var isDarkMode: Bool = true
    @Published var motivationalQuote: String = ""
    @Published var goals: [GoalItem] = []

    var topTrait: PersonalityTrait {
        personalityScores.max(by: { $0.value < $1.value })?.key ?? .analytical
    }

    // Fix: motivationalQuote was missing from reset — old quote bled into new session
    func reset() {
        userName = ""
        selectedSubjects = []
        personalityScores = Dictionary(uniqueKeysWithValues: PersonalityTrait.allCases.map { ($0, 0) })
        primaryCareers = []
        alternateCareers = []
        bookmarkedCareers = []
        skillProgress = [:]
        goals = []
        motivationalQuote = ""
    }
}

enum SkillStatus: String, CaseIterable {
    case notStarted = "Not Started"
    case learning = "Learning"
    case learned = "Learned"

    var color: Color {
        switch self {
        case .notStarted: return .gray
        case .learning: return .orange
        case .learned: return .green
        }
    }

    var icon: String {
        switch self {
        case .notStarted: return "circle"
        case .learning: return "clock.fill"
        case .learned: return "checkmark.circle.fill"
        }
    }
}

struct GoalItem: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
