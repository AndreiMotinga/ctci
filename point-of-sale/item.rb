class Item

  attr_reader :pricing_info, :name, :count
  def initialize(pricing_info, item)
    @pricing_info = pricing_info
    @name = item[0]
    @count = item[1]
  end

  def total
    return count * discount_price if use_discounted_price?
    return with_batch_discount if apply_batch_discount?
    count * base_price
  end

  private

  def with_batch_discount
    with_discount = (count / batch_count) * batch_price
    remainder = (count % batch_count) * base_price
    with_discount + remainder
  end

  def use_discounted_price?
    return false unless discount
    return false if count < discount_count
    true
  end

  def discount
    pricing_info[name][:discount]
  end

  def discount_price
    discount[:price]
  end

  def discount_count
    discount[:count]
  end

  def apply_batch_discount?
    !!batch
  end

  def base_price
    pricing_info[name][:price]
  end

  def batch
    pricing_info[name][:batch]
  end

  def batch_count
    batch[:count]
  end

  def batch_price
    batch[:price]
  end
end
