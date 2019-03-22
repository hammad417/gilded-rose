class GildedRose
  
  BACKSTAGE_PASSES = ["Aged Brie"]
  LENGENDARY = ["Sulfuras"]

  def initialize(items)
    @items = items
  end 

  def update_daily
    @items.each do |item|
      update_quality(item)
    end
  end

  def update_quality(item)
    if !sell_by_date_has_passed(item)
      if item.quality >= 0
        if BACKSTAGE_PASSES.include?(item.name)
          if five_or_less_days(item)
            increase_by_three(item)
          elsif ten_or_less_days(item)
            increase_by_two(item)
          else
            increase_by_one(item)
          end
        elsif !LENGENDARY.include?(item.name)
          decrease_by_one(item)         
        end
      end
    else
      drops_to_zero
    end
  end

  def decrease_by_one(item)
    item.quality -=1
    item.quality = 0 if item.quality < 0
  end

  def drops_to_zero(item)
    item.quality =0
  end

  def sell_by_date_has_passed(item)
    item.sell_in < 1
    check_for_fifty(item)
  end

  def increase_by_three(item)
    item.quality += 3 
  end

  def check_for_fifty(item)
    item.quality = 50 if item.quality > 50
  end

  def increase_by_two(item)
    item.quality += 2
    check_for_fifty(item)
  end
  def increase_by_one(item)
    item.quality += 1
    check_for_fifty(item)
  end

  def five_or_less_days(item)
    item.sell_in <=5
  end

  def ten_or_less_days(item)
    item.sell_in <= 10
  end
end
