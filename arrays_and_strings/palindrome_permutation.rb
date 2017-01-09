class PalindromePermutation
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def palindrome?
    return if many_single_chars?
    return if odd_chars?
    true
  end

  private

  def many_single_chars?
    chars.values.count { |x| x == 1 } > 1
  end

  def odd_chars?
    chars.values.select { |x| x > 1 && x.odd? }.any?
  end

  def chars
    @chars ||= count_chars
  end

  def count_chars
    chars = Hash.new(0)
    str.delete(" ").downcase.each_char { |char| chars[char] += 1 }
    chars
  end
end
