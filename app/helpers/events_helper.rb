module EventsHelper
  def price(event)
    if event.free?
      return "Free"
    else
      number_to_currency(event.price, precision:0)
    end
  end

  def day_and_time(event)
    event.starts_at.strftime("%B %d at %I:%M %P") rescue "No time"
  end
end
