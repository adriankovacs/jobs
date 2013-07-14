module Errors

  ERRORS = {
    :unknown_format => {:level => "ERROR", :message => "Unknown job format or command character."},
    :self_dependency => {:level => "ERROR", :message => "Self-dependency is forbidden."},
    :circular_dependency => {:level => "ERROR", :message => "Circular dependency is forbidden."},
    :job_already_added => {:level => "WARNING", :message => "Job already added."},
    :jobs_already_added => {:level => "WARNING", :message => "Jobs already added."}
  }

  def self.raise(message_type)
    puts "#{ERRORS[message_type][:level]}: #{ERRORS[message_type][:message]}"
  end

end