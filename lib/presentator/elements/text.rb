class Presentator::Text < Presentator::Base
  attr_accessor :message, :options

  def initialize(message, opts = {})
    @options = opts
    @message = message
  end

  def show(opts = {})
    opts.merge!(options)
    offset = opts[:offset] || 0
    position = opts[:position] || :center

    width = message.length + 6
    pos = [0, width]

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

  def height
    2
  end
end
