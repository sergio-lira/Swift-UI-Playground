//
//  ExpandingListsView.swift
//  Swift UI Playground
//
//  Created by Sergio Lira on 6/27/24.
//
//  Content: #list #loops #navigationView #aligment #expandingList

import SwiftUI

struct ExpandingListView: View {
    var body: some View {
        NavigationView {
            List(HabitMockData.goalsAndHabits, children: \.children) { row in
                VStack(alignment: .leading) {
                    Text(row.title)
                    if ((row.frequency?.hashValue) != nil) {
                        Text("\(row.frequency!)")
                            .font(.footnote.monospaced())
                    }
                }
            }.navigationTitle("Goals and Habits")
        }
    }
}

struct ListItem: Identifiable {
    var id: UUID
    var title: String
    var frequency: Frequency?
    var children: [ListItem]?

    // Initializer for a Goal
    init(goal: Goal) {
        self.id = goal.id
        self.title = goal.title
        self.frequency = nil
        self.children = goal.habits.map(ListItem.init)
    }

    // Initializer for a Habit
    init(habit: Habit) {
        self.id = habit.id
        self.title = habit.title
        self.frequency = habit.frequency
        self.children = nil
    }
}


struct HabitMockData {
    static var goalsAndHabits: [ListItem] = {
        let habit1 = Habit(id: UUID(), title: "Read a book", description: "Read for 30 minutes", frequency: .daily)
        let goal1 = Goal(id: UUID(), title: "Personal Development", habits: [habit1])

        let habit2 = Habit(id: UUID(), title: "Morning Run", description: "Run for 20 minutes", frequency: .daily)
        let habit3 = Habit(id: UUID(), title: "Evening Walk", description: "Walk for 30 minutes", frequency: .daily)
        let goal2 = Goal(id: UUID(), title: "Health & Fitness", habits: [habit2, habit3])

        let habit4 = Habit(id: UUID(), title: "Meditate", description: "Meditate for 15 minutes", frequency: .daily)
        let habit5 = Habit(id: UUID(), title: "Yoga", description: "Practice yoga for 30 minutes", frequency: .weekly)
        let habit6 = Habit(id: UUID(), title: "Healthy Eating", description: "Eat a healthy meal", frequency: .daily)
        let goal3 = Goal(id: UUID(), title: "Well-being", habits: [habit4, habit5, habit6])

        let goals = [goal1, goal2, goal3]
        return goals.map(ListItem.init)
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
    case daily, weekly, monthly
}

#Preview {
    ExpandingListView()
}
