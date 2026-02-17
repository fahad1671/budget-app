import SwiftUI

struct BudgetSettingsSheet: View {
    @EnvironmentObject var budgetManager: BudgetManager
    @Binding var isPresented: Bool
    
    @State private var budgetAmount: String = ""
    @State private var showError = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Weekly Budget")) {
                    HStack {
                        Text("$")
                        TextField("100.00", text: $budgetAmount)
                            .keyboardType(.decimalPad)
                    }
                    
                    if !budgetAmount.isEmpty, let amount = Double(budgetAmount) {
                        Text("Budget: $\(String(format: "%.2f", amount))")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                
                if showError && (budgetAmount.isEmpty || Double(budgetAmount) == nil || Double(budgetAmount) ?? 0 <= 0) {
                    Section {
                        Text("Please enter a valid amount greater than 0")
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Budget Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveBudget()
                    }
                    .font(.system(.body, design: .default).weight(.semibold))
                }
            }
            .onAppear {
                budgetAmount = String(format: "%.2f", budgetManager.weeklyBudget)
            }
        }
    }
    
    private func saveBudget() {
        guard let amount = Double(budgetAmount), amount > 0 else {
            showError = true
            return
        }
        
        budgetManager.updateBudget(amount)
        isPresented = false
    }
}

#Preview {
    BudgetSettingsSheet(isPresented: .constant(true))
        .environmentObject(BudgetManager())
}
