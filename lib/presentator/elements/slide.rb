class Presentator::Slide < Presentator::Base
  def show(opts = {})
    elements.each_with_index do |element, index|
      element.show(offset: -index * element.height)
    end
    getch
    clear
    refresh
  end
end
