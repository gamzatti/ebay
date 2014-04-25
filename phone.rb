class Phone
attr_accessor :name, :release_date, :initial_value, :capacityGB, :condition
@@phones = []

  def initialize(name, release_year, release_month, initial_value=:unknown, capacityGB=:unknown, condition=:unknown)
    @name = name
    @release_date = Date.new(release_year, release_month)
    @initial_value = initial_value
    @capacityGB = capacityGB
    @condition = condition
    @@phones << self
  end

  def Phone.all
    @@phones
  end

end


Phone.new(:iphone4, 2010, 6, 499, 16)
Phone.new(:galaxys2, 2011, 5, 499)
Phone.new(:chacha, 2011, 6, 250)
Phone.new(:iphone4s, 2011, 10, 499, 16)
Phone.new(:lumia800, 2011, 11, 470)
Phone.new(:galaxymini2, 2012, 2, 150)
Phone.new(:galaxys3, 2012, 5, 520)
Phone.new(:iphone5, 2012, 9, 529, 16)
Phone.new(:lumia920, 2012, 11)



#https://en.wikipedia.org/wiki/Samsung_Galaxy
#https://en.wikipedia.org/wiki/List_of_iOS_devices                
# These should be read in from a csv file, but I don't have time to learn how to do that. http://stackoverflow.com/questions/12673466/ruby-read-csv-and-pick-out-variables http://ruby-doc.org/stdlib-1.9.3/libdoc/csv/rdoc/CSV.html

