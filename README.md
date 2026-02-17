# Budget Tracker iOS App

A simple SwiftUI app for tracking weekly budget and daily expenses.

## Features

- 💰 Set your weekly budget
- 📝 Add expenses with item name and amount
- 📊 Visual progress tracking with a progress bar
- 💾 Persistent storage using UserDefaults
- ✏️ Delete expenses with swipe action
- 📱 Clean, intuitive interface built with SwiftUI

## Project Structure

```
BudgetTracker/
├── BudgetTrackerApp.swift       # Main app entry point
├── Info.plist                   # App configuration
├── Models/
│   └── BudgetManager.swift      # Budget logic and state management
└── Views/
    ├── ContentView.swift         # Main UI
    ├── AddExpenseSheet.swift      # Add expense form
    └── BudgetSettingsSheet.swift # Budget settings form
```

## Building on Mac

### Prerequisites
- Mac with Xcode installed (available from App Store)
- iOS 15.0 or later
- ~1 GB free space for Xcode if not installed

### Option 1: Build via Xcode (Recommended for IPA)

1. **Copy project files to Mac:**
   - Transfer all files from this folder to your Mac
   
2. **Create a new Xcode project:**
   - Open Xcode
   - File → New → Project
   - Choose "App" template
   - Set:
     - Product Name: `BudgetTracker`
     - Team ID: (Sign in with Apple ID or skip)
     - Organization Identifier: `com.budgettracker`
     - Interface: SwiftUI
     - Language: Swift

3. **Replace the generated files:**
   - Delete the auto-generated Swift files
   - Drag the `.swift` files from this project into Xcode
   - Replace `Info.plist` with the one provided

4. **Build settings:**
   - Select project in navigator
   - Select target
   - Build Settings
   - Ensure "Minimum Deployments" is iOS 15.0 or later

5. **Build the IPA:**
   - Product → Scheme → Edit Scheme
   - Select "Release" for Build Configuration
   - Product → Build For → Any iOS Device (generic)
   - Product → Archive
   - Click "Distribute App"
   - Choose "Custom"
   - Select "Export" and choose "Ad Hoc" (for unsigned/LiveContainer)
   - Save the IPA file

### Option 2: Use Cloud Build Service

If you don't have access to a Mac, use:
- **Codemagic** (codemagic.io)
- **App Center** (appcenter.ms)
- **GitHub Actions** with macOS runner

Steps:
1. Push this code to a GitHub repository
2. Connect to a cloud build service
3. Configure to build unsigned IPA for Ad Hoc distribution
4. Download the IPA

### Option 3: Quick Script (on Mac with Command Line Tools)

If you have Swift CLI tools:

```bash
cd /path/to/BudgetTracker
swift build
```

## Installing on LiveContainer

1. Download **LiveContainer** from the App Store
2. Transfer the IPA file to your iPhone:
   - Via AirDrop
   - Via email
   - Via cloud storage (iCloud Drive, Google Drive, etc.)
3. Open LiveContainer
4. Tap the "+" button
5. Select the IPA file
6. Tap "Install"
7. Tap the app to launch

## App Usage

1. **Set Budget:**
   - Tap the settings button (slider icon) in the top-left
   - Enter your weekly budget
   - Tap "Save"

2. **Add Expense:**
   - Tap the "+" button in the top-right
   - Enter item name (e.g., "Groceries")
   - Enter amount
   - Tap "Add"

3. **View Progress:**
   - Main screen shows:
     - Weekly budget amount
     - Total spent (in red)
     - Progress bar (green/orange/red)
     - Remaining budget

4. **Delete Expense:**
   - Swipe left on any expense
   - Tap "Delete"

## Data Storage

- All data is stored locally on the device using UserDefaults
- Budget and expenses are saved automatically
- Data persists between app launches

## Requirements

- iOS 15.0 or later
- iPhone or iPad
- ~5 MB storage space

## Notes

- Weekly budget resets every 7 days
- All amounts in USD (easily customizable)
- App works completely offline
- No internet permission required

## Troubleshooting

**App won't install on LiveContainer:**
- Ensure IPA is built for "Ad Hoc" distribution (unsigned)
- Check that iOS version is 15.0 or later
- Try downloading and reinstalling LiveContainer

**Data not saving:**
- This shouldn't happen, but restart the app
- Hard restart your iPhone if needed

**Can't find IPA file:**
- In Xcode, Archive should open Finder with the IPA ready to export
- Look in your Downloads folder typically

## Support

For issues with the app source code, you can modify the Swift files and rebuild.

Common customizations:
- Change currency: Find `"$"` strings in Views
- Adjust budget reset period: Edit `isCurrentWeek()` in BudgetManager.swift
- Modify UI colors: Edit color values in Views
