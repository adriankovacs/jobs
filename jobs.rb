class Jobs

  def self.init
    # Initializing...
    puts "Initializing..."
    @jobs = {}
    self.get_job
  end

  def self.get_job
    # Get the job or control commands
    puts "Pleas give me a job. (Format: a => [b] #b is optional) Hit ':p' to PROCESS sequence, ':c' to CLEAR sequence or ':q' to EXIT."
    self.process_job(gets.chomp)
  end

  def self.check_job(job)
    # Some tests on input format and dependencies.
  end

  def self.process_job(job)
    self.check_job(job)

    # Control commands
    self.print_sequence   if job == ":p"
    self.init             if job == ":c"
    abort("Bye.")         if job == ":q"

    # Here comes job processing...
    puts "Job added: \"#{job}\""
    self.get_job
  end

  def self.print_sequence
    # Put sequence to the screen.
    puts "Here comes the sequence:"
    self.get_job
  end

end

# Start!
Jobs.init
