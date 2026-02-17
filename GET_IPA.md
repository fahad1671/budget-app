# 🎯 Get Your IPA - Action Plan

**Your goal:** Get the IPA file built and installed on your iPhone via LiveContainer.

## ⏱️ Time Estimates

- **Option A (Borrow a Mac)**: 15 minutes
- **Option B (Cloud)**: 20-30 minutes  
- **Option C (Ask friend)**: 5 minutes + waiting

---

## OPTION A: Build on a Mac (Fastest if you have one)

### Prerequisites (1 min)
- [ ] Access to a Mac with Xcode (free from App Store)
- [ ] Download Xcode if needed (takes ~15 minutes on its own)

### Steps (14 min)

1. **Copy Files (1 min)**
   - [ ] Transfer the entire `budget app` folder to the Mac
   - [ ] Use AirDrop, email, cloud drive, or USB

2. **Follow Xcode Guide (10 min)**
   - [ ] Open `XCODE_SETUP.md` on the Mac
   - [ ] Follow steps 1-6 exactly as written
   - [ ] You'll have the IPA at the end

3. **Transfer to iPhone (3 min)**
   - [ ] Follow "Step 7: Get IPA to iPhone"
   - [ ] AirDrop is fastest

**Total Time: ~15 minutes**

---

## OPTION B: Cloud Build (Best for Windows Users)

### Pick a Service

#### Codemagic (Recommended)
1. **Setup (10 min)**
   - [ ] Create GitHub account (github.com)
   - [ ] Create new repository named `budget-tracker`
   - [ ] Upload the BudgetTracker folder contents
   - [ ] Sign up at codemagic.io with your GitHub

2. **Configure Build (5 min)**
   - [ ] Read QUICKSTART.md section "Using Codemagic"
   - [ ] Create `codemagic.yaml` file from the example
   - [ ] Commit and push

3. **Build Runs Automatically (5 min)**
   - [ ] Codemagic detects your push
   - [ ] Automatically builds
   - [ ] Download IPA from build artifacts

**Total Time: ~20 minutes**

#### Microsoft App Center (Alternative)
1. [ ] Go to appcenter.ms
2. [ ] Connect GitHub account
3. [ ] Select your repository
4. [ ] Configure iOS build
5. [ ] Wait for build
6. [ ] Download IPA

**Total Time: ~25 minutes**

---

## OPTION C: Ask a Developer Friend

1. [ ] Send them the entire `budget app` folder
2. [ ] Ask them to follow XCODE_SETUP.md
3. [ ] They send you the IPA file
4. [ ] You proceed to "Install on iPhone"

**Total Time: 5 minutes + waiting**

---

## 📱 Install on iPhone (Same for all options)

Once you have the IPA file:

### Step 1: Download LiveContainer (5 min)
- [ ] Open App Store on iPhone
- [ ] Search "LiveContainer"
- [ ] Tap Get / Download
- [ ] Wait for installation

### Step 2: Get IPA to iPhone (5-10 min)

**Choose one method:**

- **AirDrop** (if source is Mac):
  - [ ] Open Finder with IPA
  - [ ] Click AirDrop
  - [ ] Select your iPhone
  - [ ] Accept on iPhone

- **Email**:
  - [ ] Email IPA or zipped IPA to yourself
  - [ ] Open email on iPhone
  - [ ] Download the file

- **iCloud Drive**:
  - [ ] Send IPA to iCloud Drive
  - [ ] Open Files on iPhone
  - [ ] Find file in iCloud Drive

- **Google Drive**:
  - [ ] Upload IPA to Google Drive
  - [ ] Open Google Drive app on iPhone
  - [ ] Download file

### Step 3: Install in LiveContainer (2 min)
- [ ] Open Files app on iPhone (or cloud app)
- [ ] Find the `.ipa` file
- [ ] Tap Share button
- [ ] Select "Open With..."
- [ ] Choose LiveContainer
- [ ] Tap "Install"
- [ ] Wait for completion (usually <1 min)
- [ ] Tap "Open" or find on Home Screen

### Step 4: Use the App (Now!)
- [ ] Tap the BudgetTracker app
- [ ] See "Slider" icon → Set your budget
- [ ] See "+" icon → Add expenses
- [ ] Track your spending!

---

## ✅ Success Checklist

After installation, verify:

- [ ] App opens without crashing
- [ ] You can set a budget (tap settings icon)
- [ ] You can add expenses (tap + button)
- [ ] Expenses appear in list
- [ ] Progress bar shows your spending
- [ ] You can delete expenses
- [ ] App works without internet

If all checked: **You're done! 🎉**

---

## ❌ Troubleshooting

### IPA file won't install in LiveContainer

**Solution:**
- [ ] Make sure IPA was built for "Ad Hoc" distribution
- [ ] Reinstall LiveContainer (delete and re-download)
- [ ] Restart iPhone
- [ ] Verify iOS version is 15.0+

### Forgot which option to choose?

- **Have a Mac?** → Option A (fastest)
- **Don't have a Mac?** → Option B (Codemagic)
- **Know someone with a Mac?** → Option C (easiest)

### Build process stuck?

- **On Mac:** Clean build (Cmd+K) and try again
- **Cloud:** Check build logs on the service
- **Ask friend:** Ask them to check Xcode logs

### App crashes on launch

- [ ] Make sure iOS is 15.0+
- [ ] Restart phone
- [ ] Delete and reinstall app
- [ ] Check Xcode build was successful

---

## 📞 Need Help?

1. **Confused about steps?** → Read QUICKSTART.md
2. **Need Xcode details?** → Read XCODE_SETUP.md
3. **Want to understand files?** → Read FILES_REFERENCE.md
4. **Full documentation?** → Read README.md

---

## 🎯 Next Step

**Pick your option (A, B, or C) and follow the steps above!**

You'll have a working budget tracking app in your pocket within 30 minutes. 💰
