cask 'blank-screensaver' do
  version '2.1.1'
  sha256 'fa35c8bd75f09a01abc27cf723bf56b3844ace6b5f911592e75bd9040861edff'

  url "https://github.com/theseal/macos-blank-screensaver/archive/#{version}.tar.gz"
  name 'Blank'
  desc 'A blank (black) screensaver for MacOS/OS X.'
  homepage 'https://github.com/theseal/macos-blank-screensaver'

  if MacOS.version == :mojave || MacOS.version == :big_sur
    screen_saver "macos-blank-screensaver-#{version}/Blank.saver"
  else
    screen_saver "macos-blank-screensaver-#{version}/Blank.qtz"
  end

  preflight do
    File.delete('~/Library/Screen Savers/Blank.qtz') if File.exist?('~/Library/Screen Savers/Blank.qtz')
    FileUtils.remove_dir('~/Library/Screen Savers/Blank.saver') if File.directory?('~/Library/Screen Savers/Blank.saver')
  end

  caveats <<~EOS
    NOTE: Don't forget to enable the screensaver named "Blank" in "Desktop & Screen saver".
    `open /System/Library/PreferencePanes/DesktopScreenEffectsPref.prefPane`
  EOS

end
