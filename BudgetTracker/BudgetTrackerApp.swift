import SwiftUI

@main
struct BudgetTrackerApp: App {
    @StateObject private var budgetManager = BudgetManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(budgetManager)
        }
    }
}
