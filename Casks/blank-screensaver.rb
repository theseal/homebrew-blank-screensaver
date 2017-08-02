cask 'blank-screensaver' do
  version '1.0.0'
  sha256 '1d1620ed7a06e3c49540b0a18f9925713cd82be940fbb826e1b61af334b6eede'

  url "https://github.com/theseal/macos-blank-screensaver/archive/#{version}.tar.gz"
  name 'Blank'
  homepage 'https://github.com/theseal/macos-blank-screensaver'

  screen_saver "macos-blank-screensaver-#{version}/Blank.qtz"

  def caveats; <<-EOF.undent
    NOTE: Don't forget to enable the screensaver named "Blank" in "Desktop & Screen saver".
    `open /System/Library/PreferencePanes/DesktopScreenEffectsPref.prefPane`
    EOF
  end

end
