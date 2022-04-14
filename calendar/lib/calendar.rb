class Calendar
  attr_accessor :months, :week, :mon
  
  def initialize(months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], week = ["Su " , "Mo " , "Tu ", "We " , "Th " , "Fy " , "Sa"], mon = [1, 3, 5, 7, 8, 10, 12])
    @months = months
    @week = week
    @mon = mon
  end

  def kind_month
    @current_month = nil
    month = nil
    if mon.include?(Time.now.month)
      month = ("01".."31").to_a
    elsif mon == 2
      month = ("01".."28").to_a
    else
      month = ("01".."30").to_a
    end
      @current_month = month
  end

  def mark_today
    kind_month
    @current_month.each_with_index do |n,i|
      if n.to_i == Time.now.day
        @current_month[i] = "[#{n}]"
      end
    end
  end
  
  def first_week_day_in_month
    mark_today
    week_days = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]
    @result = nil
    position = nil
    
    week_days.each do |n|
      today = Time.now
      if (today - (today.day - 1)*86400).sunday?
        position = week_days.index("sunday")
      elsif (today - (today.day - 1)*86400).monday?
        position = week_days.index("monday")
      elsif (today - (today.day - 1)*86400).tuesday?
        position = week_days.index("tuesday")
      elsif (today - (today.day - 1)*86400).wednesday?
        position = week_days.index("wednesday")
      elsif (today - (today.day - 1)*86400).thursday?
        position = week_days.index("thursday")
      elsif (today - (today.day - 1)*86400).friday?
        position = week_days.index("friday")
      elsif (today - (today.day - 1)*86400).saturday?
        position = week_days.index("saturday")
      end
    end
      @result = position
  end

  def adjust_output_month
    first_week_day_in_month
    @output = nil
    @result.times do
      @current_month.unshift("  ")
    end
      complete_month = ["#{@months[Time.now.month-1]} #{Time.now.year}",week.join]
      @current_month.each_slice(7){|n| complete_month << "#{n.join(" ")}\n"}
      @output = complete_month
  end

  def display
    adjust_output_month

    @output
  end
end

Calendar.new.adjust_output_month