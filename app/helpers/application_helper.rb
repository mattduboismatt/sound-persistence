module ApplicationHelper

  def date_to_str(date)
    date.strftime("%-m/%-d/%Y")
  end

  def str_to_date(date_str)
    Date.strptime(date_str, '%m/%d/%Y')
  end

  def find_delimiter(line)
    if line.include?(",")
      ", "
    elsif line.include?("|")
      " | "
    else
      " "
    end
  end

end