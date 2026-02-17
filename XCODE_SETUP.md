# Detailed Xcode Setup Instructions (for Mac Users)

This guide walks you through creating an Xcode project and building the IPA step-by-step.

## Step 1: Prepare Your Files

You already have all the source code needed:
- `BudgetTracker/Models/BudgetManager.swift`
- `BudgetTracker/Views/ContentView.swift`
- `BudgetTracker/Views/AddExpenseSheet.swift`
- `BudgetTracker/Views/BudgetSettingsSheet.swift`
- `BudgetTracker/BudgetTrackerApp.swift`
- `BudgetTracker/Info.plist`

## Step 2: Create Xcode Project

1. **Open Xcode** (if not installed, download from App Store)

2. **Create New Project:**
   - File → New → Project
   - Or Command+Shift+N

3. **Select Template:**
   - iOS tab (at the top)
   - Application section
   - Click "App"
   - Click Next

4. **Configure Project:**
   - Product Name: `BudgetTracker`
   - Team: (Select your team or "None" if you don't have a developer account)
   - Organization Identifier: `com.budgettracker`
   - Bundle Identifier: Should auto-fill as `com.budgettracker.BudgetTracker`
   - Interface: SwiftUI
   - Language: Swift
   - Storage: Just leave defaults
   - Click Next

5. **Choose Location:**
   - Select the parent folder containing this README
   - Uncheck "Create Git repository on my Mac"
   - Click Create

## Step 3: Add Source Files

1. **Delete Auto-Generated Files:**
   - In Xcode, expand `BudgetTracker` folder in navigator
   - Delete `ContentView.swift` (only the auto-generated one)
   - Delete `BudgetTrackerApp.swift` (only the auto-generated one)
   - Keep the main folder structure

2. **Add Models Group:**
   - Right-click on `BudgetTracker` folder in navigator
   - New Group
   - Name it `Models`
   - Drag `BudgetManager.swift` into this group

3. **Add Views Group:**
   - Right-click on `BudgetTracker` folder
   - New Group
   - Name it `Views`
   - Drag these files into Views group:
     - `ContentView.swift`
     - `AddExpenseSheet.swift`
     - `BudgetSettingsSheet.swift`

4. **Update BudgetTrackerApp.swift:**
   - Replace the auto-generated file with the provided `BudgetTrackerApp.swift`

5. **Replace Info.plist:**
   - Select `Info.plist` in navigator
   - Delete it
   - Drag the provided `Info.plist` into Xcode

## Step 4: Verify Project Settings

1. **Select Project in Navigator**
   - Click on "BudgetTracker" (the blue icon) at the top

2. **Check Targets:**
   - Select "BudgetTracker" target
   - Go to General tab
   - Verify:
     - iOS Deployment Target: 15.0 or later
     - Bundle Identifier: `com.budgettracker.BudgetTracker`
     - Signing: Should show your Team (or None)

3. **Check Build Settings:**
   - Build Settings tab
   - Search for "swift language version"
   - Should be Swift 5.7 or later
   - Search for "minimum deployment"
   - Should be 15.0 or later

## Step 5: Build and Test

1. **Select Simulator:**
   - Top of Xcode window
   - Change from "BudgetTracker" → "iPhone 15 Pro" (or any available)

2. **Run the App:**
   - Press Cmd+R or Product → Run
   - App should compile and open in simulator
   - Test the features:
     - Set a budget
     - Add expenses
     - See the progress bar update

3. **Troubleshoot if needed:**
   - If build fails, check that all .swift files have correct target membership
   - Select each file and verify "Target Membership" includes BudgetTracker
   - Clean build: Cmd+K
   - Rebuild: Cmd+B

## Step 6: Create IPA for LiveContainer

### Quick Method:

1. **Select Generic Device:**
   - Top of Xcode, where iPhone simulator is shown
   - Click the dropdown
   - Scroll down to "Destinations"
   - Select "Any iOS Device (generic)"

2. **Archive the App:**
   - Product → Archive
   - Wait for build to complete
   - Automatically opens Organizer window

3. **Export for Ad-Hoc:**
   - In Organizer, app archive should be selected
   - Click "Distribute App" button
   - Select "Custom" (not App Store)
   - Click Next
   - Select "Ad Hoc"
   - Click Next (on distribution options, keep defaults)
   - Review Signing: If it says "Automatic Signing", that's fine for unsigned apps
   - Click "Review" then "Export"
   - Save the `.ipa` file

### Detailed Method (if above doesn't work):

1. **Open Terminal:**
   - Applications → Utilities → Terminal

2. **Navigate to Project:**
   ```bash
   cd /path/to/BudgetTracker
   ```

3. **Build Archive:**
   ```bash
   xcodebuild archive \
     -project BudgetTracker.xcodeproj \
     -scheme BudgetTracker \
     -configuration Release \
     -archivePath ~/Desktop/BudgetTracker.xcarchive
   ```

4. **Export IPA:**
   ```bash
   xcodebuild \
     -exportArchive \
     -archivePath ~/Desktop/BudgetTracker.xcarchive \
     -exportOptionsPlist ExportOptions.plist \
     -exportPath ~/Desktop/Output
   ```

5. **Find IPA:**
   - Check Desktop/Output folder
   - The `.ipa` file is there

## Step 7: Get IPA to iPhone

1. **Using AirDrop (easiest):**
   - Open Finder
   - Find the `.ipa` file
   - Drag onto a nearby connected iPhone
   - Accept on iPhone

2. **Using Email:**
   - Compress the `.ipa` file (right-click → Compress)
   - Email to yourself
   - Download on iPhone
   - Open with LiveContainer

3. **Using iCloud Drive:**
   - Copy `.ipa` to iCloud Drive folder
   - Open Files app on iPhone
   - Navigate to iCloud Drive
   - Open with LiveContainer

## Step 8: Install in LiveContainer

1. **Download LiveContainer:**
   - App Store on iPhone
   - Search "LiveContainer"
   - Download (free)

2. **Install the IPA:**
   - Open LiveContainer
   - Tap the "+" button
   - Select the IPA file
   - Tap "Install"
   - Wait for installation
   - Tap "Open" or go to Home Screen

3. **Use the App:**
   - Tap Settings icon (slider) to set budget
   - Tap + button to add expenses
   - View progress on main screen

## Common Issues and Fixes

### "Unknown error building archive"
- Product → Clean Build Folder (Shift+Cmd+K)
- Try again

### "No file found at path..."
- Make sure all files are added to the project
- Select each .swift file
- Check File Inspector on the right
- Make sure target BudgetTracker is checked under Target Membership

### "Code signing required"
- Select Project → Targets → BudgetTracker → Signing & Capabilities
- Make sure Team is selected
- Uncheck "Automatically manage signing"
- Check it again to re-enable

### "Unsupported Swift version"
- Select Project → Build Settings
- Search "Swift Language Version"
- Make sure it's not too new or too old

### IPA won't install on LiveContainer
- Make sure exported as "Ad Hoc" not "App Store"
- Try deleting and re-downloading LiveContainer
- Make sure iPhone iOS is 15.0 or later

## Success Indicators

✓ App runs in simulator without errors
✓ Can set budget in Settings
✓ Can add expenses with the + button
✓ Expenses appear in list below
✓ Progress bar shows spending
✓ IPA file created successfully
✓ LiveContainer installs the IPA without errors
✓ App works on actual iPhone

## You're Done!

Once you have a working IPA on your iPhone, you can:
- Use the app daily
- Modify the code and rebuild if needed
- Share with others (they'll need LiveContainer too)
- Customize colors, text, or functionality

Enjoy your budget tracker! 💰
