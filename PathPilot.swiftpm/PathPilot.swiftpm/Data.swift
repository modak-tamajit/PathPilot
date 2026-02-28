import SwiftUI

// MARK: - Quiz Questions (10 questions — scenario + preference mix)
// Each question maps directly to Indian career paths.
// Options are deliberately distinct so scoring separates candidates clearly.

let quizQuestions: [QuizQuestion] = [

    QuizQuestion(
        text: "Your class has to solve a real-world problem. What's your first move?",
        emoji: "🧩",
        options: [
            QuizOption(text: "Collect data, study the root cause, build a logical solution", traits: [.analytical: 4, .research: 2]),
            QuizOption(text: "Sketch ideas and think of a creative angle nobody's tried", traits: [.creative: 4, .practical: 1]),
            QuizOption(text: "Talk to people affected by the problem, understand their pain", traits: [.social: 4, .leadership: 1]),
            QuizOption(text: "Just start experimenting — learn by doing and fix as you go", traits: [.practical: 4, .leadership: 1])
        ]
    ),

    QuizQuestion(
        text: "Which of these would you be happiest doing every single day?",
        emoji: "⚡️",
        options: [
            QuizOption(text: "Writing code, solving equations, or running experiments", traits: [.analytical: 3, .practical: 3]),
            QuizOption(text: "Designing, drawing, writing, or making something visual", traits: [.creative: 4, .practical: 2]),
            QuizOption(text: "Talking to people, counselling, teaching, or leading teams", traits: [.social: 3, .leadership: 3]),
            QuizOption(text: "Reading, researching, debating ideas, writing papers", traits: [.research: 4, .analytical: 2])
        ]
    ),

    QuizQuestion(
        text: "It's exam week and your friend group is panicking. You naturally...",
        emoji: "📚",
        options: [
            QuizOption(text: "Make a structured study plan and share notes with everyone", traits: [.analytical: 3, .leadership: 2]),
            QuizOption(text: "Create colourful summaries, mind maps, or visual aids", traits: [.creative: 3, .practical: 2]),
            QuizOption(text: "Motivate and calm people down — you're the emotional anchor", traits: [.social: 4, .leadership: 2]),
            QuizOption(text: "Go into deep solo study mode — you research everything thoroughly", traits: [.research: 4, .analytical: 2])
        ]
    ),

    QuizQuestion(
        text: "If you could change one thing about India, what would you focus on?",
        emoji: "🇮🇳",
        options: [
            QuizOption(text: "Make world-class technology and innovation accessible to all", traits: [.analytical: 3, .practical: 3]),
            QuizOption(text: "Fix broken systems — governance, law, policy, public services", traits: [.leadership: 4, .social: 2]),
            QuizOption(text: "Improve health, mental wellness, and quality of life for people", traits: [.social: 4, .research: 2]),
            QuizOption(text: "Grow the economy, create jobs, build businesses that scale", traits: [.leadership: 3, .practical: 3])
        ]
    ),

    QuizQuestion(
        text: "Your ideal Saturday afternoon looks like...",
        emoji: "🌤️",
        options: [
            QuizOption(text: "Building a side project, coding an app, or solving puzzles", traits: [.practical: 3, .analytical: 3]),
            QuizOption(text: "Painting, writing, making music, or creating content", traits: [.creative: 5, .practical: 1]),
            QuizOption(text: "Volunteering, hanging out with people, or mentoring juniors", traits: [.social: 4, .leadership: 2]),
            QuizOption(text: "Reading deeply about something you're obsessed with", traits: [.research: 5, .analytical: 1])
        ]
    ),

    QuizQuestion(
        text: "You get admission to two colleges — one is top-ranked, the other has your dream course. You...",
        emoji: "🎓",
        options: [
            QuizOption(text: "Go where the curriculum matches your passion completely", traits: [.research: 3, .creative: 2]),
            QuizOption(text: "Pick the top-ranked one — network and prestige open doors", traits: [.leadership: 3, .analytical: 2]),
            QuizOption(text: "Ask mentors and family — make a collective, informed decision", traits: [.social: 3, .practical: 2]),
            QuizOption(text: "Build a spreadsheet. Compare placements, ROI, and future scope", traits: [.analytical: 4, .practical: 2])
        ]
    ),

    QuizQuestion(
        text: "Which of these career risks feels most acceptable to you?",
        emoji: "🎲",
        options: [
            QuizOption(text: "Spending years in research with no guaranteed outcome", traits: [.research: 4, .analytical: 2]),
            QuizOption(text: "Starting a business that might fail — but also might explode", traits: [.leadership: 3, .practical: 3]),
            QuizOption(text: "Choosing a creative field where income is unpredictable", traits: [.creative: 4, .practical: 2]),
            QuizOption(text: "A demanding but stable path like medicine or civil services", traits: [.social: 2, .analytical: 2, .research: 2])
        ]
    ),

    QuizQuestion(
        text: "Teachers and friends usually compliment you on...",
        emoji: "🏅",
        options: [
            QuizOption(text: "How sharp, logical, and precise your thinking is", traits: [.analytical: 4, .research: 2]),
            QuizOption(text: "How creative, original, and imaginative your ideas are", traits: [.creative: 5, .practical: 1]),
            QuizOption(text: "How well you connect with, understand, and help people", traits: [.social: 5, .leadership: 1]),
            QuizOption(text: "How confidently you lead, decide, and take charge", traits: [.leadership: 5, .practical: 1])
        ]
    ),

    QuizQuestion(
        text: "Which type of problem excites you the most?",
        emoji: "🔭",
        options: [
            QuizOption(text: "Technical: how do systems, machines, or algorithms work?", traits: [.analytical: 3, .practical: 3]),
            QuizOption(text: "Human: why do people behave the way they do?", traits: [.social: 3, .research: 3]),
            QuizOption(text: "Creative: how can this be made more beautiful or impactful?", traits: [.creative: 4, .practical: 2]),
            QuizOption(text: "Systemic: why does society work this way, and how to improve it?", traits: [.leadership: 3, .research: 3])
        ]
    ),

    QuizQuestion(
        text: "In 20 years, how do you want to be remembered?",
        emoji: "🌟",
        options: [
            QuizOption(text: "As someone who made a scientific breakthrough or built great tech", traits: [.research: 3, .analytical: 3]),
            QuizOption(text: "As a leader who changed policy, led people, or built institutions", traits: [.leadership: 4, .social: 2]),
            QuizOption(text: "As a creative who made art, stories, or designs that moved people", traits: [.creative: 4, .practical: 2]),
            QuizOption(text: "As someone who directly helped, healed, and uplifted lives", traits: [.social: 4, .research: 2])
        ]
    )
]

// MARK: - Career Database (24 Indian-context careers)
let careerDatabase: [Career] = [

    // ── SCIENCE & TECH ──
    Career(
        title: "Software Engineer",
        emoji: "💻",
        description: "Build apps, platforms, and systems that millions use. India is the world's software powerhouse — and it needs builders like you.",
        requiredSubjects: [.computerScience, .mathematics, .physics],
        requiredTraits: [.analytical, .practical, .research],
        skills: ["Python / Java / Swift", "Data Structures & Algorithms", "System Design", "APIs & Databases", "Problem Solving"],
        roadmap: [
            RoadmapStep(step: 1, title: "Pick a Language & Stick to It", description: "Python or Java for placements. Swift for iOS. JavaScript for web. Build small projects every week.", level: .beginner),
            RoadmapStep(step: 2, title: "Master DSA", description: "Data Structures & Algorithms are the gateway to any top tech job. Use LeetCode + GeeksForGeeks daily.", level: .beginner),
            RoadmapStep(step: 3, title: "Build 3 Real Projects", description: "A web app, a mobile app, and an API. Put them on GitHub. These are your interview currency.", level: .intermediate),
            RoadmapStep(step: 4, title: "System Design Basics", description: "Learn how Netflix, Zomato, and Swiggy are built. High Level Design is asked in senior roles.", level: .intermediate),
            RoadmapStep(step: 5, title: "Crack Placements", description: "Target FAANG, Unicorns, or strong product companies. Competitive programming helps a lot.", level: .advanced)
        ],
        platforms: ["LeetCode", "GeeksForGeeks", "CS50 (Harvard free)", "NPTEL Programming", "Striver's DSA Sheet"],
        timeline: "6–18 months to job-ready",
        salaryRange: "₹6–40 LPA",
        collegeTypes: ["IIT / NIT / IIIT (JEE)", "BITS Pilani (BITSAT)", "VIT / Manipal / SRM", "Top State Engineering Colleges"],
        entranceExams: ["JEE Main & Advanced", "BITSAT", "VITEEE", "MHT-CET"],
        scholarshipTip: "NSP and AICTE scholarships for engineering. Strong GitHub profile is worth more than rank in many startups."
    ),

    Career(
        title: "AI / ML Engineer",
        emoji: "🤖",
        description: "Train the systems that power ChatGPT, recommendation engines, and autonomous vehicles. The most in-demand engineering role of this decade.",
        requiredSubjects: [.computerScience, .mathematics, .statistics, .physics],
        requiredTraits: [.analytical, .research, .practical],
        skills: ["Python", "Linear Algebra & Calculus", "Machine Learning", "Deep Learning", "PyTorch / TensorFlow"],
        roadmap: [
            RoadmapStep(step: 1, title: "Math First", description: "Linear algebra, probability, statistics, and calculus. These are non-negotiable foundations.", level: .beginner),
            RoadmapStep(step: 2, title: "ML Fundamentals", description: "Andrew Ng's Coursera ML course. Understand regression, classification, clustering inside out.", level: .beginner),
            RoadmapStep(step: 3, title: "Deep Learning", description: "Neural networks, CNNs, RNNs, Transformers. Build them from scratch in PyTorch.", level: .intermediate),
            RoadmapStep(step: 4, title: "Kaggle Competitions", description: "Build a real portfolio on Kaggle. Top performers get hired directly by companies.", level: .intermediate),
            RoadmapStep(step: 5, title: "Specialize & Publish", description: "Choose NLP, Vision, or RL. Read papers on arXiv. Contribute to open source.", level: .advanced)
        ],
        platforms: ["Coursera: Andrew Ng ML", "fast.ai", "Kaggle", "3Blue1Brown (YouTube)", "Papers With Code"],
        timeline: "1–3 years to first ML role",
        salaryRange: "₹10–60 LPA",
        collegeTypes: ["IIT / IISc", "IIIT Hyderabad", "CMI", "ISI Kolkata"],
        entranceExams: ["JEE Main & Advanced", "IIIT entrance", "JEST", "GATE CS"],
        scholarshipTip: "Google, Microsoft, DeepMind research fellowships. KVPY for early-stage researchers."
    ),

    Career(
        title: "Doctor / Physician",
        emoji: "🏥",
        description: "India needs 600,000 more doctors. The most respected profession in the country — and one of the most meaningful lives you can live.",
        requiredSubjects: [.biology, .chemistry, .zoology, .physics],
        requiredTraits: [.social, .research, .analytical],
        skills: ["Clinical Diagnosis", "Patient Communication", "Anatomy & Physiology", "Pharmacology", "Emergency Medicine"],
        roadmap: [
            RoadmapStep(step: 1, title: "NEET Preparation (Class 11–12)", description: "Physics, Chemistry, Biology — all three equally. NEET UG is the only gateway. Start coaching in Class 10.", level: .beginner),
            RoadmapStep(step: 2, title: "MBBS — 5.5 Years", description: "Pre-clinical (Anatomy, Physiology, Biochemistry), Para-clinical, and Clinical phases with hospital postings.", level: .beginner),
            RoadmapStep(step: 3, title: "Internship (1 Year)", description: "Rotate through Medicine, Surgery, OBG, Paediatrics, Community Health. Essential hands-on training.", level: .intermediate),
            RoadmapStep(step: 4, title: "PG Entrance — MD / MS", description: "NEET PG. Choose specialisation: General Medicine, Surgery, Psychiatry, Radiology, Paediatrics etc.", level: .intermediate),
            RoadmapStep(step: 5, title: "Super-speciality or Independent Practice", description: "DM/MCh for super-specialty or set up your own clinic / join a multi-specialty hospital.", level: .advanced)
        ],
        platforms: ["Marrow App", "PrepLadder", "DAMS", "Osmosis on YouTube", "NCERT Biology"],
        timeline: "8–13 years (MBBS + PG)",
        salaryRange: "₹8–80 LPA",
        collegeTypes: ["AIIMS (Delhi + 15 campuses)", "JIPMER Puducherry", "Government Medical Colleges", "AFMC Pune"],
        entranceExams: ["NEET UG", "NEET PG", "AIIMS PG", "USMLE (for abroad)"],
        scholarshipTip: "Government MBBS seats are heavily subsidised (₹10K–50K/year). ICMR fellowships for research-oriented doctors."
    ),

    Career(
        title: "Research Scientist",
        emoji: "🔬",
        description: "Discover what nobody has discovered before. ISRO, DRDO, IISc, and TIFR are waiting for India's next generation of scientists.",
        requiredSubjects: [.physics, .chemistry, .biology, .mathematics],
        requiredTraits: [.research, .analytical, .practical],
        skills: ["Scientific Method", "Statistical Analysis", "Lab Techniques", "Academic Writing", "Grant Writing"],
        roadmap: [
            RoadmapStep(step: 1, title: "Strengthen Fundamentals", description: "HC Verma for Physics, JD Lee for Chemistry, Campbell for Biology — go beyond NCERT.", level: .beginner),
            RoadmapStep(step: 2, title: "BSc / BS in Core Science", description: "IISc BS, IISER BS-MS, or top university BSc. Choose your discipline carefully.", level: .beginner),
            RoadmapStep(step: 3, title: "Summer Research Internships", description: "Apply to IISER, ICTS, TIFR programs. Getting your name on a paper early is a huge advantage.", level: .intermediate),
            RoadmapStep(step: 4, title: "MSc / Integrated PhD", description: "Join a lab with a strong supervisor. Your advisor matters more than the institute name.", level: .intermediate),
            RoadmapStep(step: 5, title: "PhD & Post-doc", description: "Publish original research. Attend international conferences. Build global collaborations.", level: .advanced)
        ],
        platforms: ["arXiv.org", "PubMed", "NPTEL Science Courses", "MIT OCW", "ResearchGate"],
        timeline: "8–12 years (BSc to independent researcher)",
        salaryRange: "₹4–20 LPA (Scientist Grade A–F in DRDO/ISRO)",
        collegeTypes: ["IISc Bangalore", "IISER (Pune, Kolkata, Mohali, Bhopal, Thiruvananthapuram)", "TIFR Mumbai", "IIT Research Programs"],
        entranceExams: ["KVPY / INSPIRE-SHE", "IISER Aptitude Test / JEE", "JEST", "CSIR NET / GATE"],
        scholarshipTip: "DST INSPIRE scholarship ₹80K/year. PM Research Fellowship for PhD scholars at IITs and IISc."
    ),

    Career(
        title: "Biomedical Engineer",
        emoji: "🧬",
        description: "Design the devices that save lives — MRI machines, prosthetic limbs, drug delivery systems. The bridge between medicine and engineering.",
        requiredSubjects: [.biology, .physics, .mathematics, .chemistry],
        requiredTraits: [.research, .analytical, .practical],
        skills: ["Medical Device Design", "Biomechanics", "Signal Processing", "MATLAB", "Clinical Trial Protocols"],
        roadmap: [
            RoadmapStep(step: 1, title: "Strong Bio + Physics Base", description: "Excel in both Biology and Physics/Math in Class 12. This duality defines biomedical engineering.", level: .beginner),
            RoadmapStep(step: 2, title: "B.Tech Biomedical Engineering", description: "4 years: electronics, human physiology, imaging systems, biomaterials, and medical devices.", level: .beginner),
            RoadmapStep(step: 3, title: "Hospital & Industry Internships", description: "Work with biomedical engineers in hospitals. Device calibration and maintenance experience.", level: .intermediate),
            RoadmapStep(step: 4, title: "M.Tech / MS Research", description: "Specialize in neural engineering, medical imaging, drug delivery, or prosthetics.", level: .intermediate),
            RoadmapStep(step: 5, title: "Regulatory Knowledge", description: "Understanding CDSCO / FDA medical device approval is what separates junior from senior engineers.", level: .advanced)
        ],
        platforms: ["NPTEL Bioengineering", "IEEE EMBS resources", "PubMed", "MIT OCW", "Coursera Biomedical"],
        timeline: "4–8 years (B.Tech + specialisation)",
        salaryRange: "₹5–22 LPA",
        collegeTypes: ["IIT / NIT Biomedical depts.", "VIT Vellore", "Manipal University", "AIIMS Engineering"],
        entranceExams: ["JEE Main", "BITSAT", "VITEEE", "GATE BM"],
        scholarshipTip: "DBT research fellowships. Many medtech startups fund and hire brilliant B.Tech interns."
    ),

    Career(
        title: "Cybersecurity Analyst",
        emoji: "🔐",
        description: "Every bank, hospital, and government system needs protection. Ethical hackers are India's most urgently needed tech professionals right now.",
        requiredSubjects: [.computerScience, .mathematics, .physics],
        requiredTraits: [.analytical, .research, .practical],
        skills: ["Networking & Protocols", "Ethical Hacking", "Linux", "Cryptography", "Incident Response"],
        roadmap: [
            RoadmapStep(step: 1, title: "Networking Fundamentals", description: "TCP/IP, DNS, HTTP, firewalls. How does the internet actually work? CompTIA Network+ level.", level: .beginner),
            RoadmapStep(step: 2, title: "Linux Mastery", description: "90% of security work is done in Linux terminal. Use Kali Linux daily.", level: .beginner),
            RoadmapStep(step: 3, title: "Ethical Hacking & Pen Testing", description: "TryHackMe and HackTheBox platforms. Learn OWASP Top 10 vulnerabilities.", level: .intermediate),
            RoadmapStep(step: 4, title: "Certifications", description: "CEH, CompTIA Security+, OSCP. These are the industry gold standards.", level: .intermediate),
            RoadmapStep(step: 5, title: "Bug Bounty & CTFs", description: "Find real vulnerabilities, report them ethically. Many students earn ₹5–50 lakh from bug bounties.", level: .advanced)
        ],
        platforms: ["TryHackMe", "HackTheBox", "Cybrary", "OWASP Foundation", "IIT Bombay Cybersecurity NPTEL"],
        timeline: "1–2 years to first role",
        salaryRange: "₹5–30 LPA",
        collegeTypes: ["IIT / NIT", "IIIT", "Amrita (top for cybersecurity in India)", "C-DAC programs"],
        entranceExams: ["JEE Main", "BITSAT", "C-DAC entrance"],
        scholarshipTip: "CERT-In and DSCI offer funded programs. Bug bounty winnings can fully fund your education."
    ),

    Career(
        title: "Data Scientist",
        emoji: "📊",
        description: "Every company — from Swiggy to SEBI — runs on data decisions. You turn noise into insight that drives billions in business value.",
        requiredSubjects: [.mathematics, .statistics, .computerScience, .economics],
        requiredTraits: [.analytical, .research, .practical],
        skills: ["Python / R", "Statistics & Probability", "Machine Learning", "SQL", "Data Visualisation"],
        roadmap: [
            RoadmapStep(step: 1, title: "Statistics & Probability", description: "Mean, variance, distributions, hypothesis testing. The foundation everything else sits on.", level: .beginner),
            RoadmapStep(step: 2, title: "Python for Data", description: "Pandas, NumPy, Matplotlib, Seaborn. Clean and explore real-world datasets.", level: .beginner),
            RoadmapStep(step: 3, title: "Machine Learning", description: "Scikit-learn. Build regression, classification, and clustering models on real datasets.", level: .intermediate),
            RoadmapStep(step: 4, title: "SQL & Databases", description: "Write complex queries. Every data role has a SQL round in interviews.", level: .intermediate),
            RoadmapStep(step: 5, title: "End-to-end Projects", description: "Build 3 projects with real messy data. Deploy them online. Write about them on Medium.", level: .advanced)
        ],
        platforms: ["Kaggle", "StatQuest (YouTube)", "Mode Analytics SQL Tutorial", "fast.ai", "Towards Data Science"],
        timeline: "9–18 months to first role",
        salaryRange: "₹8–45 LPA",
        collegeTypes: ["IIT / IISc", "ISI Kolkata", "CMI Chennai", "Top NITs"],
        entranceExams: ["JEE / GATE", "ISI Entrance", "CMI Entrance"],
        scholarshipTip: "DST INSPIRE. Winning Kaggle competitions is more valuable than a certificate in this field."
    ),

    // ── HEALTH & SOCIAL ──
    Career(
        title: "Psychologist / Counsellor",
        emoji: "🧠",
        description: "India has 1 mental health professional per 100,000 people. The need is enormous. Help people heal, grow, and understand themselves.",
        requiredSubjects: [.psychology, .sociology, .englishLiterature],
        requiredTraits: [.social, .research, .analytical],
        skills: ["Active Listening", "CBT & Therapy Techniques", "Research Methods", "Case Documentation", "Empathy"],
        roadmap: [
            RoadmapStep(step: 1, title: "BA / BSc Psychology", description: "Core branches: developmental, social, clinical, neuropsychology. Choose a college with good labs.", level: .beginner),
            RoadmapStep(step: 2, title: "Volunteer & Intern Early", description: "iCall, Vandrevala Foundation, local NGOs. Hands-on experience in Year 1 is critical.", level: .beginner),
            RoadmapStep(step: 3, title: "MA / MSc Clinical Psychology", description: "TISS, NIMHANS, Delhi University have India's top programs. Specialize here.", level: .intermediate),
            RoadmapStep(step: 4, title: "RCI Licensing", description: "Rehabilitation Council of India registration is mandatory to practice clinically in India.", level: .intermediate),
            RoadmapStep(step: 5, title: "Practice or Research", description: "Private practice, hospital psychiatry department, or research on India's mental health crisis.", level: .advanced)
        ],
        platforms: ["APA PsycNET", "NIMHANS e-resources", "Coursera: Yale Science of Wellbeing", "Therapy in a Nutshell (YouTube)", "PubMed"],
        timeline: "5–7 years (BA + MA + licensing)",
        salaryRange: "₹3–18 LPA",
        collegeTypes: ["TISS Mumbai / Hyderabad", "NIMHANS Bangalore", "Delhi University", "Christ University Bangalore"],
        entranceExams: ["TISSNET", "CUET", "NIMHANS entrance", "IPU CET"],
        scholarshipTip: "UGC scholarship during MA. TISS has its own financial aid. Many online therapy platforms hire fresh MA graduates."
    ),

    Career(
        title: "Environmental Scientist",
        emoji: "🌱",
        description: "India faces air pollution, water crises, and climate disasters. You study, fight, and fix these problems at the intersection of science and policy.",
        requiredSubjects: [.biology, .chemistry, .geography, .zoology],
        requiredTraits: [.research, .social, .analytical],
        skills: ["GIS & Remote Sensing", "Environmental Modelling", "Field Research", "Policy Analysis", "Sustainability Assessment"],
        roadmap: [
            RoadmapStep(step: 1, title: "BSc Environmental Science / Zoology / Botany", description: "Ecology, geology, climatology, environmental chemistry. Build a strong scientific base.", level: .beginner),
            RoadmapStep(step: 2, title: "NGO & Field Internships", description: "WWF India, Greenpeace, WRI India, Forest Departments. Real field work is irreplaceable.", level: .beginner),
            RoadmapStep(step: 3, title: "GIS & Remote Sensing", description: "Learn QGIS, ArcGIS, Google Earth Engine. Satellite data analysis is the new lab.", level: .intermediate),
            RoadmapStep(step: 4, title: "MSc Environmental Science", description: "Specialise in climate science, wildlife biology, water management, or pollution control.", level: .intermediate),
            RoadmapStep(step: 5, title: "Policy, UN, or Industry", description: "Work with MoEFCC, UNEP, TERI, or private sustainability consultancies.", level: .advanced)
        ],
        platforms: ["UNEP e-learning", "NASA Earthdata", "Down To Earth magazine", "TERI resources", "Coursera: Climate & Energy"],
        timeline: "4–8 years",
        salaryRange: "₹4–18 LPA",
        collegeTypes: ["TERI University", "JNU New Delhi", "Wildlife Institute of India", "IIT Environmental Engineering"],
        entranceExams: ["CUET", "JNU entrance", "GATE Environmental", "Wildlife Institute entrance"],
        scholarshipTip: "WWF India, DBT, DST-SERB offer funded fellowships. UNEP and GEF fund Indian environmental researchers."
    ),

    // ── CIVIL SERVICES & LAW ──
    Career(
        title: "Civil Services Officer (IAS/IPS/IFS)",
        emoji: "🏛️",
        description: "The most powerful administrative role in India. IAS officers run districts and ministries. IPS leads law enforcement. IFS represents India globally.",
        requiredSubjects: [.history, .geography, .politicalScience, .economics, .sociology],
        requiredTraits: [.leadership, .analytical, .social],
        skills: ["Policy Analysis", "Public Administration", "Constitutional Law", "Critical Thinking", "Communication & Decision Making"],
        roadmap: [
            RoadmapStep(step: 1, title: "NCERT Mastery (Class 6–12)", description: "History, Geography, Polity, Economics — all NCERTs are the Bible for UPSC. Read every word.", level: .beginner),
            RoadmapStep(step: 2, title: "Any Graduation (Any Stream)", description: "Engineers, doctors, and humanities graduates all crack UPSC. Your stream does not limit you.", level: .beginner),
            RoadmapStep(step: 3, title: "Prelims Preparation", description: "Current affairs, Indian Polity, History, Geography, Economy. Daily newspaper is non-negotiable.", level: .intermediate),
            RoadmapStep(step: 4, title: "Mains — Answer Writing", description: "Write 10 answers daily. Choose optional wisely — Sociology, PSIR, History are popular choices.", level: .intermediate),
            RoadmapStep(step: 5, title: "Personality Test / Interview", description: "Be authentic, confident, and aware. Panel tests your world view, integrity, and decision-making.", level: .advanced)
        ],
        platforms: ["Drishti IAS", "Vision IAS", "Unacademy UPSC", "The Hindu / Indian Express", "NCERT Digital Textbooks"],
        timeline: "3–7 years of dedicated preparation",
        salaryRange: "₹56K–2.5L/month + allowances",
        collegeTypes: ["LBSNAA Mussoorie (IAS training)", "Sardar Vallabhbhai Patel NPA (IPS)", "Any recognised university for graduation"],
        entranceExams: ["UPSC CSE (Prelims + Mains + Interview)", "State PCS exams", "CAPF AC exam"],
        scholarshipTip: "Free UPSC prep on YouTube (Drishti, Vision IAS). Many institutes offer merit scholarships. State PSC is a great parallel track."
    ),

    Career(
        title: "Lawyer / Legal Professional",
        emoji: "⚖️",
        description: "Argue for justice, draft laws, and protect rights. From Supreme Court litigation to corporate M&A law — India's legal profession has never been more lucrative.",
        requiredSubjects: [.politicalScience, .history, .englishLiterature, .sociology],
        requiredTraits: [.analytical, .leadership, .social],
        skills: ["Legal Research", "Argumentation & Advocacy", "Contract Drafting", "Constitutional Law", "Client Communication"],
        roadmap: [
            RoadmapStep(step: 1, title: "CLAT Preparation (Class 11–12)", description: "English, Legal Reasoning, GK, Logical Reasoning, Quantitative Techniques. Start in Class 11.", level: .beginner),
            RoadmapStep(step: 2, title: "BA LLB / BBA LLB (5 Years)", description: "Integrated law from NLU. Learn substantive law, procedural law, and legal research.", level: .beginner),
            RoadmapStep(step: 3, title: "Moot Courts & Internships", description: "Intern every semester with advocates, law firms, or tribunals. Moot Court is your practical lab.", level: .intermediate),
            RoadmapStep(step: 4, title: "Specialize", description: "Corporate Law (M&A, IPR), Criminal Law, Constitutional Law, Tax Law, or International Law.", level: .intermediate),
            RoadmapStep(step: 5, title: "Bar Council & Career Path", description: "Enroll with Bar Council of India. Litigation, law firm, in-house corporate, or judiciary.", level: .advanced)
        ],
        platforms: ["SCC Online", "Manupatra", "Bar & Bench", "CLAT Possible", "Legal Bites"],
        timeline: "5–8 years (LLB + establishment)",
        salaryRange: "₹4–50 LPA",
        collegeTypes: ["NLSIU Bangalore", "NALSAR Hyderabad", "NLU Delhi", "NLU Jodhpur", "Symbiosis Law School Pune"],
        entranceExams: ["CLAT", "AILET", "SLAT", "LSAT India"],
        scholarshipTip: "NLU merit scholarships. Many top law firms offer paid internships from Year 2 onward."
    ),

    // ── BUSINESS & FINANCE ──
    Career(
        title: "Chartered Accountant (CA)",
        emoji: "🧾",
        description: "The backbone of India's financial ecosystem. CAs audit companies, manage taxes, and guide businesses. One of India's most respected qualifications.",
        requiredSubjects: [.accountancy, .businessStudies, .economics, .mathematics],
        requiredTraits: [.analytical, .practical, .research],
        skills: ["Financial Reporting (Ind AS)", "Taxation (GST & Income Tax)", "Auditing & Assurance", "Corporate Law", "Financial Analysis"],
        roadmap: [
            RoadmapStep(step: 1, title: "CA Foundation (After 12th Commerce)", description: "4 papers: Accounts, Law, Quantitative Aptitude, Economics. Appear after your 12th exams.", level: .beginner),
            RoadmapStep(step: 2, title: "CA Intermediate (8 Papers, 2 Groups)", description: "Accounting, Law, Tax, Audit, FM, SFM. One of India's toughest professional exams.", level: .beginner),
            RoadmapStep(step: 3, title: "Articleship (3 Years)", description: "Train under a practicing CA. Handle real audits, tax filings, client advisory work.", level: .intermediate),
            RoadmapStep(step: 4, title: "CA Final (8 Papers)", description: "Advanced Accounting, SFM, Audit, Law, Tax — the hardest stage. Full focus required.", level: .intermediate),
            RoadmapStep(step: 5, title: "Big 4 or Own Practice", description: "Deloitte, PwC, EY, KPMG start at ₹7–10 LPA. Your own firm can scale to crores.", level: .advanced)
        ],
        platforms: ["ICAI Study Material (official)", "CA Wallah by PW", "Unacademy CA", "ICAI TV", "Sripal Jain (YouTube)"],
        timeline: "4–5 years (Foundation to Final)",
        salaryRange: "₹7–50 LPA",
        collegeTypes: ["ICAI (self-study body)", "SRCC Delhi (B.Com parallel)", "Narsee Monjee Mumbai", "Christ University Bangalore"],
        entranceExams: ["CA Foundation", "CA Intermediate", "CA Final (all by ICAI)"],
        scholarshipTip: "ICAI merit scholarships for Foundation and Intermediate toppers. Articleship stipend paid by the firm."
    ),

    Career(
        title: "Investment Banker / Financial Analyst",
        emoji: "💰",
        description: "Fund IPOs, structure M&A deals, and move billions. India's capital markets are booming and need sharp, driven analytical minds.",
        requiredSubjects: [.economics, .mathematics, .accountancy, .statistics],
        requiredTraits: [.analytical, .leadership, .practical],
        skills: ["Financial Modelling", "Valuation (DCF, LBO, Comps)", "Excel & Bloomberg", "Capital Markets", "M&A Analysis"],
        roadmap: [
            RoadmapStep(step: 1, title: "Commerce / Economics Foundation", description: "Deep understanding of financial statements, economics, and markets from Class 11–12.", level: .beginner),
            RoadmapStep(step: 2, title: "B.Com / BBA Finance or CA / CFA", description: "Economics honours from SRCC / DU, or CA / CFA route. Both are respected paths.", level: .beginner),
            RoadmapStep(step: 3, title: "Financial Modelling", description: "DCF, LBO, Comparable Company Analysis. WSP or CFI courses. Excel fluency is mandatory.", level: .intermediate),
            RoadmapStep(step: 4, title: "Internship at Bank / PE / VC", description: "Target Goldman Sachs India, ICICI Securities, boutique IB firms, or PE/VC funds.", level: .intermediate),
            RoadmapStep(step: 5, title: "IIM MBA or CFA Level 3", description: "IIM Ahmedabad / Calcutta MBA or CFA charter to reach senior roles.", level: .advanced)
        ],
        platforms: ["CFI (Corporate Finance Institute)", "Wall Street Prep", "Investopedia", "Bloomberg Market Concepts (free)", "CFA Institute resources"],
        timeline: "4–8 years to senior analyst",
        salaryRange: "₹8–50 LPA",
        collegeTypes: ["IIM Ahmedabad / Calcutta / Bombay", "SRCC Delhi", "ISB Hyderabad", "St. Xavier's Mumbai"],
        entranceExams: ["CAT", "GMAT", "CA Foundation", "CFA Level 1"],
        scholarshipTip: "ICAI and ICSI merit scholarships. Many IB firms hire directly from IIM summer placements."
    ),

    Career(
        title: "Entrepreneur / Startup Founder",
        emoji: "🚀",
        description: "India has produced Ola, Zepto, CRED, and Razorpay. The startup ecosystem is thriving — and the best time to build is always now.",
        requiredSubjects: [.economics, .businessStudies, .entrepreneurship, .accountancy],
        requiredTraits: [.leadership, .practical, .creative],
        skills: ["Business Strategy", "Product Thinking", "Sales & Growth", "Financial Literacy", "Team Building"],
        roadmap: [
            RoadmapStep(step: 1, title: "Find a Real Problem", description: "Talk to 50 people about their daily frustrations. The best startups solve genuine pain points.", level: .beginner),
            RoadmapStep(step: 2, title: "Build MVP in 4 Weeks", description: "Minimum Viable Product. Don't perfect it — ship it and collect feedback immediately.", level: .beginner),
            RoadmapStep(step: 3, title: "Get 10 Paying Customers", description: "Revenue validates the idea better than any pitch deck. Do things that don't scale yet.", level: .intermediate),
            RoadmapStep(step: 4, title: "Learn Finance & Legal", description: "Understand P&L, MCA incorporation, GST registration, and cap table basics.", level: .intermediate),
            RoadmapStep(step: 5, title: "Fundraise or Bootstrap", description: "Apply to Y Combinator, Surge by Sequoia, or 100X.VC. Or bootstrap and grow lean.", level: .advanced)
        ],
        platforms: ["Y Combinator Startup School (free)", "Paul Graham Essays", "iSPIRT Playbook", "Startup India Portal", "The Ken"],
        timeline: "No fixed timeline — lifelong journey",
        salaryRange: "₹0 → Unlimited",
        collegeTypes: ["IIM / IIT entrepreneurship cells", "ISB Hyderabad", "XLRI", "Any college — most founders are self-starters"],
        entranceExams: ["CAT / GMAT (for MBA route)", "No fixed exam for direct founding"],
        scholarshipTip: "Startup India Seed Fund (₹20 lakh). Villgro and Echoing Green for social startups. Many VCs fund student startups."
    ),

    Career(
        title: "Product Manager",
        emoji: "📱",
        description: "The CEO of the product. You own strategy, prioritisation, and delivery. India's top PMs at Google, Flipkart, and Razorpay are among the highest-paid professionals.",
        requiredSubjects: [.computerScience, .economics, .psychology, .businessStudies],
        requiredTraits: [.leadership, .analytical, .social],
        skills: ["Product Strategy", "User Research", "Data Analysis", "Roadmapping", "Stakeholder Management"],
        roadmap: [
            RoadmapStep(step: 1, title: "Understand Great Products", description: "Deconstruct Swiggy, Zomato, PhonePe. Why do they work? Read 'Inspired' by Marty Cagan.", level: .beginner),
            RoadmapStep(step: 2, title: "Learn Analytics & SQL", description: "SQL, Google Analytics, Mixpanel, A/B testing. Data is your best argument.", level: .beginner),
            RoadmapStep(step: 3, title: "Build Something Real", description: "Create an app or website. Run user interviews. Ship features and measure impact.", level: .intermediate),
            RoadmapStep(step: 4, title: "APM Programs", description: "Google APM, Microsoft PM Internship, Flipkart GEM are the most coveted entry points.", level: .intermediate),
            RoadmapStep(step: 5, title: "Ship, Measure, Repeat", description: "Own a product metric. Improve it consistently. Show impact with data every quarter.", level: .advanced)
        ],
        platforms: ["Lenny's Newsletter", "Product School", "Medium PM Articles", "Reforge", "ProductHunt"],
        timeline: "2–5 years to senior PM",
        salaryRange: "₹12–60 LPA",
        collegeTypes: ["IIT + MBA", "IIM", "XLRI", "ISB"],
        entranceExams: ["JEE then CAT", "GMAT"],
        scholarshipTip: "Build a strong product portfolio with case studies. APM programs are highly competitive but pay extremely well."
    ),

    // ── CREATIVE & DESIGN ──
    Career(
        title: "UI/UX Designer",
        emoji: "🎨",
        description: "Every app you love was designed by someone. India's design industry is growing fast — great designers now earn as much as engineers.",
        requiredSubjects: [.psychology, .englishLiterature, .computerScience],
        requiredTraits: [.creative, .analytical, .social],
        skills: ["Figma / Adobe XD", "User Research", "Wireframing & Prototyping", "Visual Design", "Usability Testing"],
        roadmap: [
            RoadmapStep(step: 1, title: "Design Fundamentals", description: "Typography, colour theory, layout, visual hierarchy. Study design with the eye of an art student.", level: .beginner),
            RoadmapStep(step: 2, title: "Master Figma", description: "Build complete app flows, components, auto-layout, and clickable prototypes.", level: .beginner),
            RoadmapStep(step: 3, title: "Psychology of Design", description: "Gestalt principles, cognitive load, Hick's Law. Great UX is fundamentally applied psychology.", level: .intermediate),
            RoadmapStep(step: 4, title: "3 Portfolio Case Studies", description: "Show your full process: research → wireframe → test → iterate → ship.", level: .intermediate),
            RoadmapStep(step: 5, title: "Learn Code Basics", description: "HTML/CSS makes you dangerous. You can design AND build. Engineers respect this enormously.", level: .advanced)
        ],
        platforms: ["Figma Academy", "Google UX Certificate (Coursera)", "Dribbble & Behance", "Nielsen Norman Group", "DesignCourse (YouTube)"],
        timeline: "3–12 months to first role",
        salaryRange: "₹4–25 LPA",
        collegeTypes: ["NID Ahmedabad", "NIFT (all campuses)", "Srishti-Manipal", "MIT Institute of Design Pune", "Pearl Academy"],
        entranceExams: ["NID DAT", "NIFT Entrance", "CEED", "UCEED"],
        scholarshipTip: "Strong Behance/Dribbble portfolio often beats a degree. Many startups hire designers from portfolio alone."
    ),

    Career(
        title: "Architect / Urban Designer",
        emoji: "🏗️",
        description: "Design the buildings and cities of tomorrow's India. Smart cities, sustainable housing, and metro infrastructure all need you.",
        requiredSubjects: [.mathematics, .physics, .geography],
        requiredTraits: [.creative, .practical, .analytical],
        skills: ["AutoCAD & Revit", "Structural Principles", "Spatial Design", "Sustainable Architecture", "Urban Planning"],
        roadmap: [
            RoadmapStep(step: 1, title: "Drawing & Visualisation", description: "Freehand sketching, technical drawing, perspective. Practice every single day.", level: .beginner),
            RoadmapStep(step: 2, title: "B.Arch (5 Years)", description: "Design studios, structures, history of architecture, services, and urban planning.", level: .beginner),
            RoadmapStep(step: 3, title: "Software Mastery", description: "AutoCAD, SketchUp, Revit, Rhino, Lumion for rendering. Not optional — industry standard.", level: .intermediate),
            RoadmapStep(step: 4, title: "Studio & Site Internships", description: "Work under licensed architects. Site visits and construction supervision are essential.", level: .intermediate),
            RoadmapStep(step: 5, title: "COA Licensing & Specialisation", description: "Council of Architecture exam to practice independently. Specialize in sustainable or urban design.", level: .advanced)
        ],
        platforms: ["ArchDaily", "Dezeen", "AutoDesk tutorials", "CEPT e-learning", "Archinect"],
        timeline: "5–8 years (B.Arch + licensing)",
        salaryRange: "₹4–25 LPA",
        collegeTypes: ["SPA Delhi / Bhopal / Vijayawada", "CEPT University Ahmedabad", "IIT Roorkee Architecture", "Chandigarh College of Architecture"],
        entranceExams: ["NATA", "JEE Paper 2 (B.Arch)", "CEPT Entrance"],
        scholarshipTip: "AICTE and state government scholarships for B.Arch students. Commonwealth Scholarship for studying abroad."
    ),

    Career(
        title: "Journalist / Writer / Content Creator",
        emoji: "✍️",
        description: "Shape public opinion, tell untold stories, hold power accountable. Digital media has opened a thousand new paths for India's best writers.",
        requiredSubjects: [.englishLiterature, .hindi, .politicalScience, .history],
        requiredTraits: [.social, .research, .creative],
        skills: ["Investigative Reporting", "Storytelling & Narrative", "Digital & Video Media", "Interviewing", "Fact-Checking"],
        roadmap: [
            RoadmapStep(step: 1, title: "Read Everything", description: "2 newspapers daily. 1 long-form article. Study how great journalists structure their stories.", level: .beginner),
            RoadmapStep(step: 2, title: "BA Journalism / Mass Communication / English", description: "IIMC, ACJ, Symbiosis, Jamia Millia. Or English Honours + build strong writing clips.", level: .beginner),
            RoadmapStep(step: 3, title: "Start Publishing Now", description: "College newspaper, Medium, Substack, YouTube. Real published clips beat any degree.", level: .intermediate),
            RoadmapStep(step: 4, title: "Pick a Beat", description: "Tech, finance, politics, science, culture. Depth and specialisation beat generalism today.", level: .intermediate),
            RoadmapStep(step: 5, title: "Build Your Own Audience", description: "Newsletter, podcast, YouTube channel. The best modern journalists are also media brands.", level: .advanced)
        ],
        platforms: ["IIMC resources", "Google News Initiative", "Reuters Journalism Handbook", "Nieman Lab", "Substack"],
        timeline: "2–5 years to establishment",
        salaryRange: "₹3–20 LPA (newsroom) · Unlimited (independent)",
        collegeTypes: ["IIMC New Delhi", "ACJ Chennai", "Jamia Millia Islamia", "Symbiosis Mass Comm", "XIC Mumbai"],
        entranceExams: ["IIMC entrance", "ACJ entrance", "CUET"],
        scholarshipTip: "Reuters Foundation and IJF fellowships. Many publications hire talented interns full-time."
    ),

    Career(
        title: "Film Director / Content Creator",
        emoji: "🎬",
        description: "OTT platforms have created 10x more opportunity for Indian storytellers. Direct films, create web series, or build a massive digital audience.",
        requiredSubjects: [.englishLiterature, .hindi, .sociology, .psychology],
        requiredTraits: [.creative, .leadership, .social],
        skills: ["Screenwriting", "Direction & Cinematography", "Video Editing (Premiere / DaVinci)", "Storytelling", "Production Management"],
        roadmap: [
            RoadmapStep(step: 1, title: "Start Making Films Now", description: "Shoot a short video today with your phone. Every great director started exactly this way.", level: .beginner),
            RoadmapStep(step: 2, title: "Film School / Mass Comm", description: "FTII Pune, Whistling Woods, Satyajit Ray Film Institute for serious cinema careers.", level: .beginner),
            RoadmapStep(step: 3, title: "Master Post-Production", description: "Adobe Premiere Pro, DaVinci Resolve, After Effects. Editing is where films are truly made.", level: .intermediate),
            RoadmapStep(step: 4, title: "Build a Portfolio Reel", description: "5+ short films or branded content pieces. Quality over quantity always.", level: .intermediate),
            RoadmapStep(step: 5, title: "Festivals + OTT + YouTube", description: "Submit to MAMI, IFFI. Pitch to Netflix, Prime, SonyLIV. Or build your own audience online.", level: .advanced)
        ],
        platforms: ["FTII e-learning", "Film Riot (YouTube)", "MasterClass Filmmaking", "No Film School blog", "Short of the Week"],
        timeline: "3–10 years to establish",
        salaryRange: "₹3 LPA → Unlimited",
        collegeTypes: ["FTII Pune", "Whistling Woods International", "Satyajit Ray Film Institute Kolkata", "Symbiosis Film", "AJK MCRC Jamia"],
        entranceExams: ["FTII Entrance Test", "Whistling Woods entrance", "NID Media Design"],
        scholarshipTip: "NFDC funds young filmmakers. Netflix and Prime Video have creator grant programs."
    ),

    // ── EDUCATION & SOCIAL IMPACT ──
    Career(
        title: "Teacher / Educator / EdTech",
        emoji: "👩‍🏫",
        description: "The profession that creates all other professions. India's education system is being reimagined — and brilliant teachers are leading that change.",
        requiredSubjects: [.history, .sociology, .englishLiterature, .hindi, .politicalScience],
        requiredTraits: [.social, .leadership, .research],
        skills: ["Curriculum Design", "Communication & Explanation", "Pedagogy", "Student Psychology", "Content Creation"],
        roadmap: [
            RoadmapStep(step: 1, title: "Graduate in Your Subject", description: "BA / BSc in your teaching subject. Honours programs preferred for depth.", level: .beginner),
            RoadmapStep(step: 2, title: "B.Ed (2 Years)", description: "Bachelor of Education — mandatory for school teaching in India. Includes teaching practice.", level: .beginner),
            RoadmapStep(step: 3, title: "CTET / State TET", description: "Central Teacher Eligibility Test for KV / NVS schools. State TET for state board schools.", level: .intermediate),
            RoadmapStep(step: 4, title: "Develop Your Teaching Style", description: "Every great teacher has a unique method. Experiment, get student feedback, refine constantly.", level: .intermediate),
            RoadmapStep(step: 5, title: "EdTech or Higher Education", description: "Unacademy, BYJU'S educator programs. Or MA + UGC NET for college and university teaching.", level: .advanced)
        ],
        platforms: ["DIKSHA (NCERT Platform)", "Unacademy Educator Program", "SWAYAM MOOCs", "Teach For India", "NCERT E-textbooks"],
        timeline: "3–5 years (Graduation + B.Ed + TET)",
        salaryRange: "₹3–20 LPA",
        collegeTypes: ["RIE (Regional Institute of Education, 5 campuses)", "Delhi University B.Ed", "Jamia Millia B.Ed", "Azim Premji University"],
        entranceExams: ["CTET", "State TET", "UGC NET (for college)", "B.Ed entrance exams"],
        scholarshipTip: "Teach For India fellowship pays ₹17K/month + stipend. UGC and NCERT fund education research. Government school teaching is highly stable."
    ),

    Career(
        title: "Social Worker / Development Professional",
        emoji: "🤝",
        description: "Work at the grassroots of India's transformation. NGOs, UN agencies, government programs, and CSR teams need passionate, skilled change-makers.",
        requiredSubjects: [.sociology, .politicalScience, .geography, .history],
        requiredTraits: [.social, .leadership, .research],
        skills: ["Community Mobilisation", "Program Design & M&E", "Fundraising & Grant Writing", "Research & Documentation", "Policy Advocacy"],
        roadmap: [
            RoadmapStep(step: 1, title: "BA Social Work / Sociology / Political Science", description: "Foundation in social theory, field work methodology, and development practice.", level: .beginner),
            RoadmapStep(step: 2, title: "Field Internships (NGOs)", description: "Work with NGOs in rural areas or urban slums. Real field experience from Year 1.", level: .beginner),
            RoadmapStep(step: 3, title: "MSW (Master of Social Work)", description: "TISS and Delhi School of Social Work are India's gold standard programs.", level: .intermediate),
            RoadmapStep(step: 4, title: "Specialise in a Cause", description: "Health, education, livelihoods, disability, women's rights, or environment. Pick your cause deeply.", level: .intermediate),
            RoadmapStep(step: 5, title: "Leadership & Policy", description: "Lead programs, write policy briefs, partner with government, or work with UN agencies.", level: .advanced)
        ],
        platforms: ["TISS e-learning", "UN Online Volunteering", "India Development Review (IDR)", "Give India resources", "Development Impact Lab"],
        timeline: "4–6 years (BA + MSW)",
        salaryRange: "₹3–15 LPA",
        collegeTypes: ["TISS Mumbai / Hyderabad / Tuljapur", "Delhi School of Social Work", "Madras School of Social Work", "Christ University"],
        entranceExams: ["TISSNET", "CUET", "University-specific MSW entrance"],
        scholarshipTip: "Tata Trusts and Azim Premji Foundation offer fellowships. TISS has strong financial aid programs."
    ),

    // ── COMMERCE SPECIALISED ──
    Career(
        title: "Company Secretary (CS)",
        emoji: "📋",
        description: "The legal and compliance backbone of every company listed on Indian stock exchanges. Every SEBI-listed company is legally required to have one.",
        requiredSubjects: [.accountancy, .businessStudies, .economics, .politicalScience],
        requiredTraits: [.analytical, .practical, .leadership],
        skills: ["Companies Act 2013", "SEBI Regulations", "Corporate Governance", "Board Secretarial Practice", "FEMA & Taxation"],
        roadmap: [
            RoadmapStep(step: 1, title: "CS Foundation (After 12th)", description: "Business Environment, Management, Economics, and Financial Accounting. 4 papers.", level: .beginner),
            RoadmapStep(step: 2, title: "CS Executive (4 Papers)", description: "Company Law, Corporate Accounting, Tax Laws, and Commercial Laws.", level: .beginner),
            RoadmapStep(step: 3, title: "Training (15 Months)", description: "Practical training under a practicing CS or company. Skill development is hands-on.", level: .intermediate),
            RoadmapStep(step: 4, title: "CS Professional (3 Papers)", description: "Governance, Risk & Compliance, Advanced Tax, Drafting, Secretarial Audit.", level: .intermediate),
            RoadmapStep(step: 5, title: "ACS & Career", description: "Join listed companies, law firms, or start your own CS practice.", level: .advanced)
        ],
        platforms: ["ICSI Study Material (official)", "CS Praveen Choudhary (YouTube)", "Unacademy CS", "ICSI e-learning portal"],
        timeline: "3–4 years (Foundation to Professional)",
        salaryRange: "₹5–30 LPA",
        collegeTypes: ["ICSI (self-study, all India)", "Any commerce college for concurrent B.Com"],
        entranceExams: ["CS Foundation", "CS Executive", "CS Professional (all by ICSI)"],
        scholarshipTip: "ICSI merit-cum-means scholarships. Training stipend paid by the company. Every SEBI-listed company legally requires a CS."
    ),

    Career(
        title: "Economist / Policy Analyst",
        emoji: "📈",
        description: "Advise governments, think tanks, and corporations on decisions that shape India's GDP, inflation, and the livelihoods of a billion people.",
        requiredSubjects: [.economics, .mathematics, .statistics, .politicalScience],
        requiredTraits: [.analytical, .research, .leadership],
        skills: ["Econometrics", "Policy Analysis", "Statistical Modelling (Stata/R)", "Economic Research", "Report Writing"],
        roadmap: [
            RoadmapStep(step: 1, title: "BA / BSc Economics (Honours)", description: "Micro, macro, statistics, econometrics. Target Delhi School of Economics, Presidency, or SRCC.", level: .beginner),
            RoadmapStep(step: 2, title: "MA Economics / MSc Economics", description: "DSE, JNU, ISI Kolkata — India's top programs. Rigorous mathematics is essential.", level: .beginner),
            RoadmapStep(step: 3, title: "Econometrics & Data Skills", description: "Stata, R, or Python for economic research. Essential for any serious policy or research role.", level: .intermediate),
            RoadmapStep(step: 4, title: "Research & Publications", description: "Publish working papers. Intern with RBI, NITI Aayog, NIPFP, NCAER.", level: .intermediate),
            RoadmapStep(step: 5, title: "PhD or Senior Policy Role", description: "PhD for academic/research. IES (Indian Economic Service) exam for government economists.", level: .advanced)
        ],
        platforms: ["JSTOR", "NBER Working Papers", "RBI research publications", "World Bank Open Data", "IMF e-learning"],
        timeline: "6–10 years (BA + MA + PhD or IES)",
        salaryRange: "₹5–25 LPA",
        collegeTypes: ["Delhi School of Economics", "JNU", "ISI Kolkata", "SRCC Delhi", "Presidency University Kolkata"],
        entranceExams: ["CUET", "DSE entrance", "ISI Entrance", "IES Exam (UPSC conducted)"],
        scholarshipTip: "UGC JRF for PhD scholars. RBI, NITI Aayog, and World Bank offer funded research internships."
    ),
]

// MARK: - Career Trait Weights (Indian context, high spread for better differentiation)
let careerTraitWeights: [String: [PersonalityTrait: Double]] = [
    "Software Engineer":                    [.analytical: 4.0, .practical: 3.0, .research: 1.5, .creative: 0.5, .social: 0.3, .leadership: 0.5],
    "AI / ML Engineer":                     [.analytical: 4.0, .research: 3.5, .practical: 2.5, .creative: 0.5, .social: 0.2, .leadership: 0.5],
    "Doctor / Physician":                   [.social: 3.0, .research: 3.0, .analytical: 2.5, .practical: 2.5, .leadership: 1.0, .creative: 0.3],
    "Research Scientist":                   [.research: 4.5, .analytical: 3.5, .practical: 1.5, .creative: 0.5, .social: 0.5, .leadership: 0.3],
    "Biomedical Engineer":                  [.research: 3.5, .analytical: 3.0, .practical: 3.0, .social: 1.0, .creative: 0.5, .leadership: 0.5],
    "Cybersecurity Analyst":                [.analytical: 3.5, .research: 3.0, .practical: 3.0, .creative: 0.5, .social: 0.3, .leadership: 0.5],
    "Data Scientist":                       [.analytical: 4.0, .research: 3.5, .practical: 2.0, .creative: 0.5, .social: 0.3, .leadership: 0.5],
    "Psychologist / Counsellor":            [.social: 4.5, .research: 2.5, .analytical: 1.5, .leadership: 1.0, .creative: 0.5, .practical: 0.5],
    "Environmental Scientist":              [.research: 3.5, .social: 2.5, .analytical: 2.5, .practical: 2.0, .creative: 0.5, .leadership: 0.5],
    "Civil Services Officer (IAS/IPS/IFS)": [.leadership: 4.0, .social: 3.5, .analytical: 3.0, .research: 2.0, .practical: 1.5, .creative: 0.5],
    "Lawyer / Legal Professional":          [.analytical: 3.5, .leadership: 3.0, .social: 2.5, .research: 2.5, .practical: 1.0, .creative: 0.5],
    "Chartered Accountant (CA)":            [.analytical: 4.5, .practical: 3.5, .research: 2.0, .leadership: 1.0, .social: 0.5, .creative: 0.2],
    "Investment Banker / Financial Analyst":[.analytical: 3.5, .leadership: 3.0, .practical: 2.5, .research: 2.0, .social: 1.0, .creative: 0.3],
    "Entrepreneur / Startup Founder":       [.leadership: 4.0, .practical: 4.0, .creative: 2.5, .social: 2.0, .analytical: 1.5, .research: 0.5],
    "Product Manager":                      [.leadership: 3.5, .analytical: 3.0, .social: 3.0, .practical: 2.0, .creative: 1.5, .research: 1.0],
    "UI/UX Designer":                       [.creative: 4.5, .analytical: 2.0, .social: 2.0, .practical: 2.0, .research: 0.5, .leadership: 0.5],
    "Architect / Urban Designer":           [.creative: 3.5, .practical: 3.0, .analytical: 2.5, .research: 1.0, .social: 0.5, .leadership: 1.0],
    "Journalist / Writer / Content Creator":[.social: 3.0, .research: 3.0, .creative: 3.0, .analytical: 1.5, .leadership: 1.0, .practical: 0.5],
    "Film Director / Content Creator":      [.creative: 4.5, .leadership: 3.0, .social: 2.5, .practical: 2.0, .analytical: 0.5, .research: 0.5],
    "Teacher / Educator / EdTech":          [.social: 4.0, .leadership: 2.5, .research: 2.0, .analytical: 1.5, .creative: 1.5, .practical: 1.0],
    "Social Worker / Development Professional":[.social: 4.5, .leadership: 3.0, .research: 2.0, .practical: 2.0, .analytical: 1.0, .creative: 0.5],
    "Company Secretary (CS)":               [.analytical: 4.0, .practical: 3.5, .leadership: 2.0, .research: 1.5, .social: 0.5, .creative: 0.2],
    "Economist / Policy Analyst":           [.analytical: 4.0, .research: 4.0, .leadership: 2.0, .social: 1.5, .practical: 1.0, .creative: 0.5],
]

// MARK: - Smart Scoring Engine
// Subject match is a hard multiplier — 0 subject matches = career heavily penalised
// Trait scoring normalised against max score for fair comparison across question counts
func computeCareers(subjects: Set<Subject>, scores: [PersonalityTrait: Int]) -> (primary: [Career], alternate: [Career]) {
    let maxScore = max(scores.values.max() ?? 1, 1)

    let ranked = careerDatabase.map { career -> (Career, Double) in

        // 1. Subject match multiplier
        let subjectMatches = career.requiredSubjects.filter { subjects.contains($0) }.count
        let subjectMultiplier: Double
        switch subjectMatches {
        case 0:       subjectMultiplier = 0.10  // near-zero — wrong stream
        case 1:       subjectMultiplier = 0.55  // weak match
        case 2:       subjectMultiplier = 0.85  // decent match
        default:      subjectMultiplier = 1.20  // strong match bonus
        }

        // 2. Weighted trait score (normalised)
        var traitScore: Double = 0
        if let weights = careerTraitWeights[career.title] {
            for (trait, weight) in weights {
                let normalised = Double(scores[trait] ?? 0) / Double(maxScore)
                traitScore += normalised * weight * 10.0
            }
        }

        // 3. Final score: trait quality × subject relevance
        let finalScore = traitScore * subjectMultiplier + Double.random(in: 0...0.2)

        return (career, finalScore)
    }
    .sorted { $0.1 > $1.1 }

    let primary = Array(ranked.prefix(3).map { $0.0 })
    let alternate = Array(ranked.dropFirst(3).prefix(5).map { $0.0 })
    return (primary, alternate)
}

// MARK: - Motivational Quotes
let motivationalQuotes: [PersonalityTrait: [String]] = [
    .analytical: [
        "Logic will get you from A to B. Imagination will take you everywhere. — Einstein",
        "The measure of intelligence is the ability to change. — Einstein",
        "Think deeply. Act precisely. The world needs both."
    ],
    .creative: [
        "Creativity is intelligence having fun. — Einstein",
        "You can't use up creativity. The more you use, the more you have. — Maya Angelou",
        "Every great design begins with an even better story."
    ],
    .social: [
        "Alone we can do so little; together we can do so much. — Helen Keller",
        "The purpose of life is to contribute in some way to making things better.",
        "Your empathy is your greatest strength."
    ],
    .leadership: [
        "Leadership is not about being in charge. It's about taking care of those in your charge.",
        "A leader is one who knows the way, goes the way, and shows the way. — John Maxwell",
        "Be the change you wish to see in the world. — Gandhi"
    ],
    .practical: [
        "An idea without execution is just a dream. Build it.",
        "Done is better than perfect. — Mark Zuckerberg",
        "The best way to predict the future is to create it. — Peter Drucker"
    ],
    .research: [
        "Research is to see what everybody else has seen and to think what nobody else has thought.",
        "The important thing is not to stop questioning. — Einstein",
        "Science is the poetry of reality. — Richard Dawkins"
    ]
]

func getMotivationalQuote(for trait: PersonalityTrait) -> String {
    motivationalQuotes[trait]?.randomElement() ?? "Your path is unique. Walk it boldly."
}

// MARK: - 30-Day Starter Plan
func generate30DayPlan(for career: Career) -> [GoalItem] {
    let titles = [
        "Day 1–3: Research \(career.title) deeply — watch 3 videos and read 2 articles about the field",
        "Day 4–7: Learn the first skill — \(career.skills.first ?? "core fundamentals")",
        "Day 8–10: Find and follow 5 working \(career.title) professionals on LinkedIn",
        "Day 11–15: Complete one beginner course or tutorial on \(career.platforms.first ?? "YouTube")",
        "Day 16–20: Build or create your first small project related to \(career.title)",
        "Day 21–23: Study roadmap Step 2 in depth — \(career.roadmap.dropFirst().first?.title ?? "Next milestone")",
        "Day 24–27: Join a community — Discord, Reddit, or Telegram group for \(career.title)",
        "Day 28–30: Reflect on your progress and write your 90-day goal plan"
    ]
    return titles.map { GoalItem(title: $0) }
}
