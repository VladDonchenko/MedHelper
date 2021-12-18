# frozen_string_literal: true

require 'time'
module ExpertsHelper
  def set_address(address)
    address.split(' ').join('+')
  end

  def selector_element(arr)
    arr.each_with_index.map { |x, i| [x.name, i + 1] }
  end

  def set_time
    (0..23).map { |x| %W[#{x}:00 #{x}:00] }
  end
end
