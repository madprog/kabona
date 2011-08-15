class Array
  def equals?(ary)
    if block_given?
      ret = (length == ary.length)
      i = 0
      while ret && i < length
        ret = yield self[i], ary[i]
        i += 1
      end
      ret
    else
      self == ary
    end
  end
end
