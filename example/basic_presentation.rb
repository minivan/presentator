
require 'presentator'

app = Presentator::App.new do
  slide do
    text "Hello there"
    text "this is harmless"
    text "it prints stuff for now, but that's fine"
  end
end

app.present!
