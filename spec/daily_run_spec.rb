require_relative '../models/gilded_rose'
require_relative '../models/item'

describe GildedRose do
	describe "#update_daily" do
  	it "should return decrease_by_one" do
  		items = [Item.new("fixme", 10, 14)]
      GildedRose.new(items).update_daily
      puts items[0]
      expect(items[0].quality).to eq 13
  	end

  	it "should return never return 0" do
  		items = [Item.new("fixme", 10, 0)]
      GildedRose.new(items).update_daily
      puts items[0]
      expect(items[0].quality).to eq 0
  	end
		
		it "10 days of Aged Brie increase by 2" do
  		items = [Item.new("Aged Brie", 10, 2)]
      GildedRose.new(items).update_daily
      puts items[0]
      expect(items[0].quality).to eq 4
  	end


		it "5 days of Aged Brie increase by 3" do
  		items = [Item.new("Aged Brie", 5, 43)]
      GildedRose.new(items).update_daily
      puts items[0]
      expect(items[0].quality).to eq 46
  	end

		it "should return never return more than 50" do
  		items = [Item.new("Aged Brie", 10, 50)]
      GildedRose.new(items).update_daily
      puts items[0]
      expect(items[0].quality).to eq 50
  	end
  	
		it "quality should never return negtive" do
  		items = [Item.new("other than Aged Brie", 10, 0)]
      GildedRose.new(items).update_daily
      puts items[0]
      expect(items[0].quality).to eq 0
  	end
  	
		it "LENGENDARY should never decrease" do
  		items = [Item.new("Sulfuras", 10, 1)]
      GildedRose.new(items).update_daily
      puts items[0]
      expect(items[0].quality).to eq 1
  	end

  end
end