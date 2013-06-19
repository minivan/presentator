class Presentator::List < Presentator::Base
  def show(opts = {})
    elements.each_with_index do |element, index|
      getch
      element.show(offset: -index * element.height)
    end
  end
end
