# Quick Start Guide for Getting IPA on LiveContainer

## What You Have

A complete SwiftUI iOS app with:
- Budget setting functionality
- Daily expense tracking
- Visual progress indicator
- Persistent data storage
- Clean, modern UI

## How to Get the IPA File

You're on Windows, but iOS apps must be built on macOS. Here are your options:

### Option A: Borrow/Use a Mac (Fastest)

1. Copy the `BudgetTracker` folder to a Mac
2. Follow the "Building on Mac" section in README.md
3. Takes about 10-15 minutes

### Option B: Cloud Build Service (No Mac Needed)

#### Using Codemagic (Recommended - Free)

1. **Create GitHub account** (if you don't have one)
2. **Create a GitHub repo:**
   - Go to github.com
   - Click "New repository"
   - Name it `budget-tracker`
   - Add the BudgetTracker folder contents
   - Commit and push

3. **Sign up for Codemagic:**
   - Visit codemagic.io
   - Sign up with GitHub
   - Click "Add app"
   - Select your `budget-tracker` repository

4. **Configure the build:**
   - Create `codemagic.yaml` in your repo root (see below)
   - Push the file
   - Codemagic will auto-build
   - Download the IPA from the build artifacts

**Sample codemagic.yaml:**
```yaml
workflows:
  default:
    name: Build iOS App
    instance_type: mac_mini_m1
    environment:
      ios: latest
      xcode: latest
    scripts:
      - name: Install dependencies
        script: |
          cd $FLUTTER_ROOT && git log --oneline -1
      - name: Build iOS
        script: |
          xcodebuild -workspace BudgetTracker.xcworkspace -scheme BudgetTracker -configuration Release -archivePath build/BudgetTracker.xcarchive archive
          xcodebuild -exportArchive -archivePath build/BudgetTracker.xcarchive -exportOptionsPlist ExportOptions.plist -exportPath build/ipa
    artifacts:
      - build/ipa/**/*.ipa
```

#### Using App Center (Microsoft, also Free)

1. Push code to GitHub
2. Go to appcenter.ms
3. Connect GitHub account
4. Select repository
5. Configure iOS build settings
6. Download built IPA

### Option C: Ask a Developer Friend

Any iOS developer with Xcode can build this in minutes.

---

## Once You Have the IPA

1. **Download LiveContainer** on your iPhone from App Store (free)

2. **Transfer the IPA file to your phone:**
   - Email it to yourself and download
   - Use iCloud Drive
   - Use Google Drive
   - Use AirDrop from a Mac
   - Use WeTransfer or similar

3. **Install the app:**
   - Open Files app on iPhone
   - Go to Downloads
   - Find the IPA file
   - Tap Share → Open With → Live Container
   - Tap Install
   - Wait for installation
   - Tap Open

4. **Use the app:**
   - Tap Settings (slider icon) to set your weekly budget
   - Tap + to add expenses
   - View your spending progress

---

## App Features Quick Tour

**Home Screen:**
- Shows your weekly budget at the top
- Shows total spent (in red)
- Progress bar indicates budget usage
- List of your expenses below

**Settings (Slider icon):**
- Set or change your weekly budget
- Default is $100/week

**Add Expense (+ button):**
- Enter item name (e.g., "Groceries", "Gas")
- Enter amount spent
- Automatically saves to history

**Delete Expense:**
- Swipe left on any expense
- Tap Delete

---

## Frequently Asked Questions

**Q: Why do I need a Mac to build iOS apps?**
A: Apple requires Xcode (Mac-only) to build official iOS apps.

**Q: Will the app work without internet?**
A: Yes! The app works completely offline. All data is stored on your phone.

**Q: Can I modify the app?**
A: Yes! All source code is included. If you make changes on a Mac, rebuild it.

**Q: Does the app cost money to use?**
A: No! It's completely free. LiveContainer is also free on the App Store.

**Q: Will it work on an old iPhone?**
A: Works on iOS 15.0 and later (iPhone XS, X, 8, or newer)

**Q: How much data/space does it use?**
A: Only about 5MB. It stores everything locally on your device.

**Q: Can I share it with friends?**
A: Not without signing it with an Apple Developer account (~$99/year). LiveContainer is how you use apps without official AppStore distribution.

**Q: What happens to my data?**
A: It's stored privately on your phone only. It never goes to a server.

---

## Troubleshooting

**"Cannot verify developer" error:**
- Go to Settings → General → VPN & Device Management
- Tap the developer profile
- Tap Trust

**IPA won't work on LiveContainer:**
- Make sure it's built for "Ad Hoc" distribution
- Ensure iOS version is 15.0+
- Try reinstalling LiveContainer

**Budget keeps resetting:**
- Check your phone's date/time settings
- The app resets every 7 days from today

**Data disappeared:**
- Force quit and reopen the app
- Try restarting your phone

---

## Next Steps

1. Choose your building method above
2. Get the IPA file
3. Install LiveContainer on your iPhone
4. Transfer the IPA and install it
5. Start tracking your budget!

Happy budgeting! 💰
