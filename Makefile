.PHONY: all install bundle bundle_debug

LOGS := true

ifeq ($(LOGS),true)
    REDIRECT :=
else
    REDIRECT := > /dev/null 2>&1
endif

all: install bundle

install:

# ══════════════════════════════════════════════════════════════════
#  RELEASE BUNDLES
# ══════════════════════════════════════════════════════════════════
bundle:
	-@dx bundle --package native --package-types "nsis" --package-types "msi" --platform windows --release $(REDIRECT) && echo "[1/5] ✅ Windows release OK" || echo "[1/5] ❌ Windows release failed"
	-@dx bundle --package native --package-types "appimage" --package-types "deb" --package-types "rpm" --package-types "updater" --platform linux --release $(REDIRECT) && echo "[2/5] ✅ Linux release OK" || echo "[2/5] ❌ Linux release failed"
	-@dx bundle --package native --package-types "macos" --package-types "dmg" --platform macos --release $(REDIRECT) && echo "[3/5] ✅ macOS release OK" || echo "[3/5] ❌ macOS release failed"
	-@dx bundle --package native --package-types "apk" --package-types "aab" --platform android --release $(REDIRECT) && echo "[4/5] ✅ Android release OK" || echo "[4/5] ❌ Android release failed"
	-@dx bundle --package native --package-types "ios" --package-types "ipa" --platform ios --release $(REDIRECT) && echo "[5/5] ✅ iOS release OK" || echo "[5/5] ❌ iOS release failed"
	@echo ""
	@echo "✅ All release bundles ended"

# ══════════════════════════════════════════════════════════════════
#  DEBUG BUNDLES
# ══════════════════════════════════════════════════════════════════
bundle_debug:
	-@dx bundle --package native --package-types "nsis" --package-types "msi" --platform windows $(REDIRECT) && echo "[1/5] ✅ Windows debug OK" || echo "[1/5] ❌ Windows debug failed"
	-@dx bundle --package native --package-types "appimage" --package-types "deb" --package-types "rpm" --platform linux $(REDIRECT) && echo "[2/5] ✅ Linux debug OK" || echo "[2/5] ❌ Linux debug failed"
	-@dx bundle --package native --package-types "macos" --package-types "dmg" --platform macos $(REDIRECT) && echo "[3/5] ✅ macOS debug OK" || echo "[3/5] ❌ macOS debug failed"
	-@dx bundle --package native --package-types "apk" --package-types "aab" --platform android $(REDIRECT) && echo "[4/5] ✅ Android debug OK" || echo "[4/5] ❌ Android debug failed"
	-@dx bundle --package native --package-types "ios" --package-types "ipa" --platform ios $(REDIRECT) && echo "[5/5] ✅ iOS debug OK" || echo "[5/5] ❌ iOS debug failed"
	@echo ""
	@echo "✅ All debug bundles ended"