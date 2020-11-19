cask 'blank-screensaver' do
  version '2.1.1'
  sha256 'fa35c8bd75f09a01abc27cf723bf56b3844ace6b5f911592e75bd9040861edff'

  url "https://github.com/theseal/macos-blank-screensaver/archive/#{version}.tar.gz"
  name 'Blank'

  homepage 'https://github.com/theseal/macos-blank-screensaver'

  if MacOS.version == :mojave
    screen_saver "macos-blank-screensaver-#{version}/Blank.saver"
  else
    screen_saver "macos-blank-screensaver-#{version}/Blank.qtz"
  end

  caveats <<~EOS
    NOTE: Don't forget to enable the screensaver named "Blank" in "Desktop & Screen saver".
    `open /System/Library/PreferencePanes/DesktopScreenEffectsPref.prefPane`

    If you upgraded from an earlier version of Blank you might need to remove
    the older version by hand…
    `rm -r ~/Library/Screen\\ Savers/Blank.*`
    …and then reinstall the Cask.
  EOS

end
