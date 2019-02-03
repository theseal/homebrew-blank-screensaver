cask 'blank-screensaver' do
  version '2.0.0'
  sha256 'e4ff7ed877f511d4baa45ea9f3446c6238b1b1ed50ce706e1f16729a80dc6093'
  url "https://github.com/theseal/macos-blank-screensaver/archive/#{version}.tar.gz"
  name 'Blank'
  homepage 'https://github.com/theseal/macos-blank-screensaver'
  screen_saver "macos-blank-screensaver-#{version}/Blank.saver"
end
