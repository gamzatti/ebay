require 'nokogiri'
require 'csv'
require 'date'
require_relative 'phone'

CSV.open("phones.csv", 'w') do |csv|
  headers = ['Type', 'ReleaseDate', 'ResaleDate', 'YearsOld', 'InitialValue£', 'ResaleValue£', 'CapacityGB', 'Condition', 'Description']
  csv << headers

  Phone.all.each do |phone_type|
    f = File.open("html/#{phone_type.name}.html")
    page = Nokogiri::HTML(f)
    f.close
    listings = page.css(".rsittlref")

    listings.each do |listing|
      row = [phone_type.name,
             a = phone_type.release_date,
             b = Date.new(2014, Date::ABBR_MONTHNAMES.index(listing.css('.tme span').text.gsub(/[0-9]*-*:*/, "").strip)),
             ((b - a)/365).to_f.round(4),
             phone_type.initial_value,
             listing.css('.prc .bidsold').text.strip.gsub(/£*,*/,""),
             phone_type.capacityGB,
             phone_type.condition,
             listing.css('h3').text.strip]
      csv << row
    end
  end
end
