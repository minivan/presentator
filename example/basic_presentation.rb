require 'presentator'

app = Presentator::App.new do
  slide do
    text 'Hello there'
    text 'this is harmless'
    text 'it prints stuff for now, but that\'s fine'
  end
  slide do
    list do
      text '1. This is the first element of the list'
      text '2. This is the second one'
      text '3. Cool, eh?'
      text '4. Cool, eh-eh?'
      text '5. This is the first element of the list'
      text '6. This is the second one'
      text '7. This is the first element of the list'
      text '8. This is the second one'
    end
  end
  slide do
    text 'Hello there', position: :top
    text 'this is the third slide'
  end
end

app.present!
