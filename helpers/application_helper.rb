module ApplicationHelper

  def formatted_date(date)
    date.strftime("%-m/%-d/%Y")
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