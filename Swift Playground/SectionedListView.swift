//
//  ExpandingListsView.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/27/24.
//
//  Content: #list #loops #sections #aligment

import SwiftUI

struct SectionedListView: View {
    let items = HabitMockData.goalsAndHabits
    
    var body: some View {
        List {
            ForEach (0..<2)  { _ in
                ForEach(items ?? []) { goal in
                    Section(header: Text(goal.title).contentShape(Rectangle())) {
                        ForEach(goal.habits) { habit in
                            VStack(alignment: .leading) {
                                Text(habit.title)
                                Text(habit.description)
                                    .font(.caption.monospaced())
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
        }
    }
}

struct HabitMockData {
    static var goalsAndHabits: [Goal]? = {
        let habit1 = Habit(id: UUID(), title: "Read a book", description: "Read for 30 minutes", frequency: .daily)
        let goal1 = Goal(id: UUID(), title: "Personal Development", habits: [habit1])
        
        let habit2 = Habit(id: UUID(), title: "Morning Run", description: "Run for 20 minutes", frequency: .daily)
        let habit3 = Habit(id: UUID(), title: "Evening Walk", description: "Walk for 30 minutes", frequency: .daily)
        let goal2 = Goal(id: UUID(), title: "Health & Fitness", habits: [habit2, habit3])
        
        let habit4 = Habit(id: UUID(), title: "Meditate", description: "Meditate for 15 minutes", frequency: .daily)
        let habit5 = Habit(id: UUID(), title: "Yoga", description: "Practice yoga for 30 minutes", frequency: .weekly)
        let habit6 = Habit(id: UUID(), title: "Healthy Eating", description: "Eat a healthy meal", frequency: .daily)
        let goal3 = Goal(id: UUID(), title: "Well-being", habits: [habit4, habit5, habit6])
        
        return [goal1, goal2, goal3]
    }()
}

struct Goal: Identifiable {
    var id: UUID
    var title: String
    var habits: [Habit]
}

struct Habit: Identifiable {
    var id: UUID
    var title: String
    var description: String
    var frequency: Frequency
}

enum Frequency {
    case daily, weekly
}

#Preview {
    SectionedListView()
}
