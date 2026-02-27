# 🧭 PathPilot — Psychology-Driven Offline Career Guidance App

> Swift Student Challenge Submission  
> Built entirely with SwiftUI · Fully Offline · Under 3 Minutes

---

## 📌 Overview

**PathPilot** is a fully offline, psychology-based career guidance app designed to help students discover their ideal academic and professional paths.

The experience is structured into three intelligent phases:

1. **Input Phase** – Collects student name & subject preferences  
2. **Psychology Quiz** – 6 weighted MCQs build a personality profile  
3. **Results Engine** – Generates personalized career matches with roadmaps, salary ranges, and college guidance  

No APIs. No tracking. No internet dependency.  
All logic runs locally using Swift models and a custom scoring engine.

---

## 🏗 Architecture

PathPilot follows a lightweight **MVVM-inspired architecture** using a shared observable session model.

### Core Pattern

- `@StateObject` → Creates the single `AppSession`
- `@ObservedObject` → Injected into child views
- `AppScreen` enum → Controls navigation
- Static data models → Stored in `Data.swift`

### Why This Approach?

- Clean separation of responsibility  
- Reactive UI updates  
- Predictable state management  
- Playground-safe navigation control  

---

## 📂 File Structure
