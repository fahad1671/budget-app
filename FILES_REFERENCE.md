# File Reference Guide

Complete guide to every file in this project.

## Documentation Files (READ THESE FIRST)

### 📖 QUICKSTART.md
**START HERE!** The fastest way to get your IPA.
- 3 options for building (Mac, Cloud, Friend)
- Feature overview
- Installation instructions for LiveContainer
- FAQ and troubleshooting
- **Read if:** You just want to get it running ASAP

### 📖 README.md
Complete project documentation.
- Feature list
- Project structure diagram
- Building on Mac (detailed)
- Cloud build service options
- App usage guide
- Data storage explanation
- **Read if:** You want full documentation

### 📖 XCODE_SETUP.md
Detailed step-by-step Xcode guide for Mac users.
- Creating a new Xcode project
- Adding source files
- Verifying project settings
- Building and testing
- Creating the IPA file
- Troubleshooting
- **Read if:** You're building on a Mac and want hand-holding

### 📖 PROJECT_SUMMARY.md
Bird's-eye view of the entire project.
- File descriptions
- Technology stack
- Key features
- Customization examples
- Testing checklist
- **Read if:** You want to understand the project structure

## Swift Source Code Files

### 🎯 BudgetTracker/BudgetTrackerApp.swift
**The entry point of your app**

Contains:
- `BudgetTrackerApp` - Main app struct
- Initializes `BudgetManager`
- Sets up WindowGroup for SwiftUI

Why it's important:
- First thing that runs when app launches
- Makes BudgetManager available to all views

### 📊 BudgetTracker/Models/BudgetManager.swift
**The brain of the app - all logic lives here**

Contains:
- `BudgetManager` class - Manages all app state
- `Expense` struct - Represents a single expense
- Budget tracking calculations
- Week-based filtering logic
- Data persistence (save/load)

Key features:
- `@Published` properties for automatic UI updates
- Expense CRUD operations
- Spending percentage calculations
- Remaining budget calculations
- UserDefaults persistence

### 🎨 BudgetTracker/Views/ContentView.swift
**Main user interface - what you see when you open the app**

Contains:
- `ContentView` - Main view
- `budgetOverviewCard` - Budget display card with progress bar
- `ExpenseRow` - Individual expense list item

Features:
- Budget overview at top
- Progress bar showing spending percentage
- List of all expenses
- Empty state message
- Navigation buttons (Settings + Add)

### ➕ BudgetTracker/Views/AddExpenseSheet.swift
**Modal form for adding new expenses**

Contains:
- `AddExpenseSheet` - The form interface
- Text input for item name
- Decimal input for amount
- Form validation logic

Features:
- Shows error messages for empty/invalid fields
- Saves expense when form is submitted
- Updates total spent automatically
- Closes after saving

### ⚙️ BudgetTracker/Views/BudgetSettingsSheet.swift
**Modal form for setting the weekly budget**

Contains:
- `BudgetSettingsSheet` - The settings form
- Decimal input for budget amount
- Form validation

Features:
- Shows current budget pre-filled
- Validates amount is greater than 0
- Saves to UserDefaults
- Closes form after saving
- Updates all calculations immediately

## Configuration Files

### 📋 Info.plist
**App configuration metadata**

Contains (key-value pairs):
- `CFBundleIdentifier` = `com.budgettracker.app`
- `CFBundleVersion` = `1`
- `LSRequiresIPhoneOS` = true
- `UIRequiredDeviceCapabilities` = `[armv7]`
- Supported interface orientations
- Minimum iOS version

Why it matters:
- Tells iOS how to identify and run the app
- Sets required capabilities
- Defines supported screen orientations

### 📋 ExportOptions.plist
**Build export configuration - used when creating IPA**

Contains:
- Export method = "ad-hoc" (for unsigned apps)
- Signing style = "automatic"
- Strip Swift symbols = true

Why it matters:
- Xcode uses this when exporting the IPA
- Makes IPA compatible with LiveContainer
- Specifies unsigned (no developer account needed)

## Build/Automation Files

### 🔧 build.sh
**Automated build script for Mac users**

What it does:
- Checks you're on macOS
- Checks Xcode is installed
- Cleans previous builds
- Creates archive
- Exports IPA
- Tells you where the IPA is

How to use:
```bash
chmod +x build.sh
./build.sh
```

Why use it:
- Automates repetitive build steps
- Saves time once Xcode project is setup
- Less chance of mistakes

## All Files at a Glance

```
📁 budget app/
│
├─ 📖 QUICKSTART.md ........................ START HERE
├─ 📖 README.md ........................... Full documentation
├─ 📖 XCODE_SETUP.md ....................... Step-by-step guide
├─ 📖 PROJECT_SUMMARY.md .................. Overview
├─ 📖 FILES_REFERENCE.md .................. This file
│
├─ 🔧 build.sh ............................ Automated build (Mac)
├─ 📋 ExportOptions.plist ................. Export settings
│
└─ 📁 BudgetTracker/
   ├─ 🎯 BudgetTrackerApp.swift ........... App entry point
   ├─ 📋 Info.plist ...................... App configuration
   │
   ├─ 📁 Models/
   │  └─ 📊 BudgetManager.swift .......... App logic & state
   │
   └─ 📁 Views/
      ├─ 🎨 ContentView.swift ........... Main UI
      ├─ ➕ AddExpenseSheet.swift ....... Add expense form
      └─ ⚙️  BudgetSettingsSheet.swift .. Settings form
```

## File Edit Checklist

**If you want to modify the app, here's what to edit:**

- [ ] **Change app name** → Edit `Info.plist` → `CFBundleName`
- [ ] **Change main color** → Edit `ContentView.swift` → Search `.tint` or `.foregroundColor`
- [ ] **Change default budget** → Edit `BudgetManager.swift` → Change `100.0` to desired amount
- [ ] **Change currency** → Edit `ContentView.swift` and `AddExpenseSheet.swift` → Replace `"$"` with your symbol
- [ ] **Change budget period** → Edit `BudgetManager.swift` → `isCurrentWeek()` function
- [ ] **Add new features** → Create new Swift files in appropriate folder

## File Purposes Quick Reference

| File | Purpose | Edit if... |
|------|---------|-----------|
| BudgetTrackerApp.swift | Entry point | You want to change app structure |
| BudgetManager.swift | Logic & state | You want to change behavior |
| ContentView.swift | Main UI | You want to change appearance |
| AddExpenseSheet.swift | Add form | You want to change form layout |
| BudgetSettingsSheet.swift | Settings form | You want to change settings options |
| Info.plist | Config | You want to change app metadata |
| ExportOptions.plist | Export options | You want to change build settings |
| build.sh | Automation | You want to customize build process |
| *.md files | Documentation | You want to update docs |

## Lines of Code Breakdown

- **BudgetTrackerApp.swift**: ~15 lines
- **BudgetManager.swift**: ~100 lines
- **ContentView.swift**: ~120 lines
- **AddExpenseSheet.swift**: ~70 lines
- **BudgetSettingsSheet.swift**: ~75 lines
- **Total App Code**: ~380 lines (very compact!)

## Total Project Size

- **Source Code**: ~25 KB
- **Configuration**: ~10 KB
- **Documentation**: ~200 KB
- **Total**: ~235 KB (even when zipped)
- **Built App Size**: ~5-10 MB (when compiled)

---

**Now you know where everything is and what it does!**

Next: Pick your building method from QUICKSTART.md 🚀
