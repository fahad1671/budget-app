import Foundation

class BudgetManager: ObservableObject {
    @Published var weeklyBudget: Double = 100.0
    @Published var expenses: [Expense] = []
    
    private let budgetKey = "weeklyBudget"
    private let expensesKey = "expenses"
    
    init() {
        loadData()
    }
    
    var totalSpent: Double {
        expenses.filter { isCurrentWeek($0.date) }.reduce(0) { $0 + $1.amount }
    }
    
    var remainingBudget: Double {
        max(0, weeklyBudget - totalSpent)
    }
    
    var spendingPercentage: Double {
        guard weeklyBudget > 0 else { return 0 }
        return min(1.0, totalSpent / weeklyBudget)
    }
    
    func addExpense(name: String, amount: Double) {
        let expense = Expense(name: name, amount: amount, date: Date())
        expenses.append(expense)
        saveData()
    }
    
    func deleteExpense(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
        saveData()
    }
    
    func updateBudget(_ amount: Double) {
        weeklyBudget = amount
        saveData()
    }
    
    private func isCurrentWeek(_ date: Date) -> Bool {
        let calendar = Calendar.current
        let now = Date()
        
        guard let weekAgo = calendar.date(byAdding: .day, value: -7, to: now) else {
            return false
        }
        
        return date >= weekAgo && date <= now
    }
    
    private func saveData() {
        UserDefaults.standard.set(weeklyBudget, forKey: budgetKey)
        
        if let encoded = try? JSONEncoder().encode(expenses) {
            UserDefaults.standard.set(encoded, forKey: expensesKey)
        }
    }
    
    private func loadData() {
        weeklyBudget = UserDefaults.standard.double(forKey: budgetKey)
        if weeklyBudget == 0 {
            weeklyBudget = 100.0
        }
        
        if let savedExpenses = UserDefaults.standard.data(forKey: expensesKey),
           let decoded = try? JSONDecoder().decode([Expense].self, from: savedExpenses) {
            expenses = decoded
        }
    }
}

struct Expense: Identifiable, Codable {
    let id: UUID
    let name: String
    let amount: Double
    let date: Date
    
    init(name: String, amount: Double, date: Date) {
        self.id = UUID()
        self.name = name
        self.amount = amount
        self.date = date
    }
}
