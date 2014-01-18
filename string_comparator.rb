module StringComparator

  def self.compare(str1, str2)
   if is_string?(str1) && is_string?(str2)
      if str1.length < str2.length
        puts str1.reverse, str2.reverse
        -1
      elsif str1.length == str2.length
        puts interpolator(str1, str2)
        0
      elsif str1.length > str2.length
        puts (interpolator str1, str2).reverse
        1
      end
    else
      raise ArgumentError, "Invalid argument type: Params must be of type string."
    end
  end

  private

  def self.interpolator(str1, str2)
    #sanity check
    str1_arr = str1.split("")
    str2_arr = str2.split("")
    result = ""

    str1_arr.each_index do |i|
      result = result + str1_arr[i]
      result = result + str2_arr[i] if i <= str2_arr.size-1
    end
    result
  end

  def self.is_string?(obj)
    obj.instance_of?(String)
  end

  #in case you cannot use Ruby String reverse method
  def self.reverse(str)
    original = str.split("")
    reversed = []
    original.each_index do |i|
      reversed[i] = original[original.size-1-i]
    end
    reversed.join("")
  end
end
