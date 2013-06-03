class Presentator::Text < Presentator::Base
  attr_accessor :message

  def initialize(message)
    @message = message
  end

  def show(params = {})
    offset = params[:offset] || 0
    position = params[:position] || :center

    width = message.length + 6
    pos = [1, width]

    case position
    when :top
      pos += [3, (cols - width)/ 2]
    when :center
      pos += [(lines - offset) / 2, (cols - width) / 2]
    end

    win = Window.new(*pos)
    win.setpos(0, 0)
    win.addstr(message)
    win.refresh
    win.close

    win
  end
end
