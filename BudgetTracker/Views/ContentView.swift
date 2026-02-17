import SwiftUI

struct ContentView: View {
    @EnvironmentObject var budgetManager: BudgetManager
    @State private var showAddExpense = false
    @State private var showBudgetSettings = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Budget Overview Card
                budgetOverviewCard
                    .padding()
                
                // Expenses List
                if budgetManager.expenses.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "creditcard")
                            .font(.system(size: 48))
                            .foregroundColor(.gray)
                        Text("No Expenses Yet")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text("Add your first expense to start tracking")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxHeight: .infinity)
                    .frame(maxWidth: .infinity)
                } else {
                    List {
                        ForEach(budgetManager.expenses.reversed()) { expense in
                            ExpenseRow(expense: expense)
                        }
                        .onDelete { offsets in
                            budgetManager.deleteExpense(at: offsets)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Budget Tracker")
            .navigationViewStyle(StackNavigationViewStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showBudgetSettings = true }) {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddExpense = true }) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            .sheet(isPresented: $showAddExpense) {
                AddExpenseSheet(isPresented: $showAddExpense)
                    .environmentObject(budgetManager)
            }
            .sheet(isPresented: $showBudgetSettings) {
                BudgetSettingsSheet(isPresented: $showBudgetSettings)
                    .environmentObject(budgetManager)
            }
        }
    }
    
    var budgetOverviewCard: some View {
        VStack(spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Weekly Budget")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("$\(String(format: "%.2f", budgetManager.weeklyBudget))")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("Spent")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("$\(String(format: "%.2f", budgetManager.totalSpent))")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
            }
            
            ProgressView(value: budgetManager.spendingPercentage)
                .tint(budgetManager.spendingPercentage > 0.9 ? .red : budgetManager.spendingPercentage > 0.7 ? .orange : .green)
            
            HStack {
                Image(systemName: budgetManager.remainingBudget > 0 ? "checkmark.circle" : "exclamationmark.circle")
                    .foregroundColor(budgetManager.remainingBudget > 0 ? .green : .red)
                
                Text("Remaining: $\(String(format: "%.2f", budgetManager.remainingBudget))")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct ExpenseRow: View {
    let expense: Expense
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(expense.name)
                    .font(.headline)
                Text(expense.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("$\(String(format: "%.2f", expense.amount))")
                .font(.headline)
                .foregroundColor(.red)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ContentView()
        .environmentObject(BudgetManager())
}
