#!/bin/bash

# Budget Tracker iOS Build Script
# This script automates building the iOS IPA file on macOS

set -e

PROJECT_NAME="BudgetTracker"
BUNDLE_ID="com.budgettracker.app"
SCHEME="BudgetTracker"
DERIVED_DATA_PATH="build"
ARCHIVE_PATH="${DERIVED_DATA_PATH}/${PROJECT_NAME}.xcarchive"
EXPORT_PATH="${DERIVED_DATA_PATH}/Export"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Budget Tracker iOS Build Script${NC}"
echo "=================================="

# Check if on macOS
if [[ ! "$OSTYPE" == "darwin"* ]]; then
    echo -e "${RED}Error: This script must run on macOS${NC}"
    exit 1
fi

# Check if Xcode is installed
if ! command -v xcodebuild &> /dev/null; then
    echo -e "${RED}Error: Xcode is not installed or not in PATH${NC}"
    echo "Install Xcode from App Store or run: xcode-select --install"
    exit 1
fi

echo -e "${GREEN}✓ Xcode found${NC}"

# Create project structure if running as standalone
if [ ! -f "Info.plist" ]; then
    echo -e "${RED}Error: Run this script from the BudgetTracker directory${NC}"
    exit 1
fi

# Clean previous builds
echo -e "${YELLOW}Cleaning previous builds...${NC}"
rm -rf "${DERIVED_DATA_PATH}"
mkdir -p "${DERIVED_DATA_PATH}"

# Note: This script assumes you've created an Xcode project named BudgetTracker.xcodeproj
# If not, you need to create it manually in Xcode

if [ ! -d "${PROJECT_NAME}.xcodeproj" ]; then
    echo -e "${RED}Error: ${PROJECT_NAME}.xcodeproj not found${NC}"
    echo "You must create an Xcode project first:"
    echo "1. Open Xcode"
    echo "2. File → New → Project"
    echo "3. Choose 'App' template"
    echo "4. Name it 'BudgetTracker'"
    echo "5. Copy the Swift files into the project"
    echo "6. Run this script again"
    exit 1
fi

# Build archive
echo -e "${YELLOW}Building archive...${NC}"
xcodebuild archive \
    -project "${PROJECT_NAME}.xcodeproj" \
    -scheme "${SCHEME}" \
    -configuration Release \
    -derivedDataPath "${DERIVED_DATA_PATH}" \
    -archivePath "${ARCHIVE_PATH}" \
    -skipPackagePluginValidation

echo -e "${GREEN}✓ Archive created${NC}"

# Export IPA for Ad Hoc (unsigned, compatible with LiveContainer)
echo -e "${YELLOW}Exporting IPA for LiveContainer...${NC}"

# Create export options plist
cat > "${DERIVED_DATA_PATH}/ExportOptions.plist" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>method</key>
    <string>ad-hoc</string>
    <key>signingStyle</key>
    <string>automatic</string>
    <key>stripSwiftSymbols</key>
    <true/>
    <key>teamID</key>
    <string></string>
</dict>
</plist>
EOF

xcodebuild \
    -exportArchive \
    -archivePath "${ARCHIVE_PATH}" \
    -exportOptionsPlist "${DERIVED_DATA_PATH}/ExportOptions.plist" \
    -exportPath "${EXPORT_PATH}"

echo -e "${GREEN}✓ IPA exported successfully${NC}"

# Find and copy IPA
IPA_FILE=$(find "${EXPORT_PATH}" -name "*.ipa" | head -n 1)

if [ -z "$IPA_FILE" ]; then
    echo -e "${RED}Error: IPA file not found after export${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Build complete!${NC}"
echo ""
echo "IPA Location: $IPA_FILE"
echo ""
echo "Next steps:"
echo "1. Transfer the IPA to your iPhone (AirDrop, email, iCloud Drive, etc.)"
echo "2. Open LiveContainer on your iPhone"
echo "3. Tap the '+' button"
echo "4. Select this IPA file"
echo "5. Tap 'Install'"
echo ""
