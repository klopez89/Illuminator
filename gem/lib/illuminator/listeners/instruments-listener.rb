
class InstrumentsListener

  def receive (message)
    puts message.full_line
    puts "  date:    #{message.date}"
    puts "  time:    #{message.time}"
    puts "  tz:      #{message.tz}"
    puts "  status:  #{message.status}"
    puts "  message: #{message.message}"
    puts "  --- If you're seeing this, #{self.class.name}.#{__method__} was not overridden"
    puts
  end

  def on_automation_finished
    puts " ==="
    puts " === If you're seeing this, #{self.class.name}.#{__method__} was not overridden"
    puts " ==="
    puts
  end

end
