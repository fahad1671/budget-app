import SwiftUI

struct AddExpenseSheet: View {
    @EnvironmentObject var budgetManager: BudgetManager
    @Binding var isPresented: Bool
    
    @State private var expenseName: String = ""
    @State private var expenseAmount: String = ""
    @State private var showError = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Expense Details")) {
                    TextField("Item name (e.g., Groceries)", text: $expenseName)
                    
                    HStack {
                        Text("$")
                        TextField("0.00", text: $expenseAmount)
                            .keyboardType(.decimalPad)
                    }
                }
                
                if showError && expenseName.trimmingCharacters(in: .whitespaces).isEmpty {
                    Section {
                        Text("Please enter an item name")
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
                
                if showError && (expenseAmount.isEmpty || Double(expenseAmount) == nil) {
                    Section {
                        Text("Please enter a valid amount")
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Add Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        addExpense()
                    }
                    .font(.system(.body, design: .default).weight(.semibold))
                }
            }
        }
    }
    
    private func addExpense() {
        let trimmedName = expenseName.trimmingCharacters(in: .whitespaces)
        guard !trimmedName.isEmpty else {
            showError = true
            return
        }
        
        guard let amount = Double(expenseAmount), amount > 0 else {
            showError = true
            return
        }
        
        budgetManager.addExpense(name: trimmedName, amount: amount)
        isPresented = false
    }
}

#Preview {
    AddExpenseSheet(isPresented: .constant(true))
        .environmentObject(BudgetManager())
}

