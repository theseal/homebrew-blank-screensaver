cask "blank-screensaver" do
  version "2.1.1"
  sha256 "fa35c8bd75f09a01abc27cf723bf56b3844ace6b5f911592e75bd9040861edff"

  url "https://github.com/theseal/macos-blank-screensaver/archive/#{version}.tar.gz"
  name "Blank"
  desc "Blank (black) screensaver"
  homepage "https://github.com/theseal/macos-blank-screensaver"

  if MacOS.version == :mojave || MacOS.version >= :big_sur
    screen_saver "macos-blank-screensaver-#{version}/Blank.saver"
  else
    screen_saver "macos-blank-screensaver-#{version}/Blank.qtz"
  end

  preflight do
    system_command "rm", args: ["-rf", "#{config.screen_saverdir}/Blank.qtz"]
    system_command "rm", args: ["-rf", "#{config.screen_saverdir}/Blank.saver"]
  end

  postflight do
    if MacOS.version >= :big_sur
      system_command "xattr",
                     args: ["-d", "com.apple.quarantine", "#{config.screen_saverdir}/Blank.saver"]
    end
  end

  caveats <<~EOS
    NOTE: Enable the screensaver named "Blank" in "Desktop & Screen saver".
    `open /System/Library/PreferencePanes/DesktopScreenEffectsPref.prefPane`
  EOS
end
