require 'presentator'

app = Presentator::App.new do
  slide do
    text 'Hello there'
    text 'this is harmless'
    text 'it prints stuff for now, but that\'s fine'
  end
#  slide do
#    list do
#      text 'This is the first element of the list'
#      text 'This is the second one'
#      text 'Cool, eh?'
#    end
#  end
  slide do
    text 'Hello there'
    text 'this is the second slide'
  end
end

app.present!
