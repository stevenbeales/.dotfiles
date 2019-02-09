
# Airport CLI alias
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias cop="tr -d '\n' | pbcopy"
alias cpwd='pwd | pbcopy'
# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
# Toggle hidden files in Finder
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'
# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias showhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'
# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"
alias pumpitup="osascript -e 'set volume 7'"
alias safari="open -a safari"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias xcode="open -a '/Developer/Applications/Xcode.app'"

# Show the ~/Library folder
chflags nohidden ~/Library

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"
# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# *** Activity Monitor
# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true

# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# *** Crash Reporter
# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# *** Dock
# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true
# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true
# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false
# Set the icon size of Dock items to 70 pixels
defaults write com.apple.dock tilesize -int 70

# *** Finder
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
    
# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# *** Safari
# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
defaults write com.apple.Safari UniversalSearchEnabled -bool false

# Press Tab to highlight each item on a web page
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Block pop-up windows
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# *** Software Uodate
# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

# *** Chrome
# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true
# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Enable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true

# Disable smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
# Set format of date & hours in menu bar
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm"

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Tweak the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float .5

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

###############################################################################
# Twitter.app                                                                 #
###############################################################################

# Disable smart quotes as it’s annoying for code tweets
defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false

# Show the app window when clicking the menu bar icon
defaults write com.twitter.twitter-mac MenuItemBehavior -int 1

# Enable the hidden ‘Develop’ menu
defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true

# Open links in the background
defaults write com.twitter.twitter-mac openLinksInBackground -bool true

# Allow closing the ‘new tweet’ window by pressing `Esc`
defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true

# Show full names rather than Twitter handles
defaults write com.twitter.twitter-mac ShowFullNames -bool true

# Hide the app in the background if it’s not the front-most window
defaults write com.twitter.twitter-mac HideInBackground -bool true

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Set grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 50" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 50" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 50" ~/Library/Preferences/com.apple.finder.plist

# Set the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 48" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 48" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 48" ~/Library/Preferences/com.apple.finder.plist

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

if [[ "$LC_TERM_PROGRAM" == "iTerm.app" ]] ; then

  bindkey "\e\e[D" backward-word # alt + <-
  bindkey "\e\e[C" forward-word # alt + ->       
  bindkey '^[[H' beginning-of-line
  bindkey '^[[F' end-of-line

fi

# Functions

isdarwin () {
    [[ $GRML_OSTYPE == "Darwin" ]]
}

batterydarwin () {
  GRML_BATTERY_LEVEL=''
  local -a table
  table=( ${$(pmset -g ps)[(w)7,8]%%(\%|);} )
  if [[ -n $table[2] ]] ; then
      case $table[2] in
          charging)
              GRML_BATTERY_LEVEL+=" ^"
              ;;
          discharging)
              if (( $table[1] < 20 )) ; then
                  GRML_BATTERY_LEVEL+=" !v"
              else
                  GRML_BATTERY_LEVEL+=" v"
              fi
              ;;
          *)
              GRML_BATTERY_LEVEL+=" ="
              ;;
      esac
      GRML_BATTERY_LEVEL+="$table[1]%%"
  fi
}
