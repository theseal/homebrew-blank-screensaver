cask 'blank-screensaver' do
  version '2.1.0'
  sha256 '068bafd2707cc9de3cdeedfc8f0d0637b2dbd86c0cb5acb1ff0fec595dd8211d'

  url "https://github.com/theseal/macos-blank-screensaver/archive/#{version}.tar.gz"
  name 'Blank'

  homepage 'https://github.com/theseal/macos-blank-screensaver'
  screen_saver "macos-blank-screensaver-#{version}/Blank.qtz" if MacOS.version == :catalina
  screen_saver "macos-blank-screensaver-#{version}/Blank.saver" if MacOS.version == :mojava
  screen_saver "macos-blank-screensaver-#{version}/Blank.qtz" if MacOS.version == :high_sierra
  screen_saver "macos-blank-screensaver-#{version}/Blank.qtz" if MacOS.version == :sierra

  caveats <<~EOS
    NOTE: Don't forget to enable the screensaver named "Blank" in "Desktop & Screen saver".
    `open /System/Library/PreferencePanes/DesktopScreenEffectsPref.prefPane`

    If you upgraded from an earlier version of Blank you might need to remove
    the older version by hand…
    `rm -r ~/Library/Screen\ Savers/Blank.*`
    …and then reinstall the Cask.
  EOS

end
