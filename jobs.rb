module Jobs

  def self.init
    # Initializing...
    puts "Initializing..."
    @jobs = JobsArray.new()
    self.get_job
  end

  def self.get_job
    # Get the job or control commands
    puts "Please give me a job. (Format: a => [b] #b is optional) Hit ':p' to PROCESS sequence, ':c' to CLEAR sequence or ':q' to EXIT."
    self.process_job(gets.chomp.strip.downcase)
  end

  def self.process_job(job_string)
    self.check_job_format(job_string)

    # Control commands
    self.print_sequence   if job_string == ":p"
    self.init             if job_string == ":c"
    abort("Bye.")         if job_string == ":q"

    # Here comes job processing...
    self.add_jobs(job_string.split("=>"))
    self.get_job
  end

  def self.check_job_format(job_string)
    # Some tests on input format.
    if job_string.match(/^:[pcq]$/).nil? && job_string.match(/^[a-zA-Z]? *=> *[a-zA-Z]?$/).nil?
      puts "ERROR: Unknown job format or command character."
      self.get_job
    elsif job_string.count(job_string[0]) > 1
      puts "ERROR: Self-dependency is forbidden."
      self.get_job
    end
  end

  def self.add_jobs(jobs)
    # Add given jobs to the jobs sequence.
    job = jobs[0].strip
    prejob = jobs[1].nil? ? nil : jobs[1].strip
    @jobs.insert_or_push([prejob, job])
    puts "Added: #{job} => #{prejob}, Sequence: #{@jobs.sequence}"
    #@jobs.index(prejob).nil? ? @jobs.push(prejob).push(job) : @jobs.insert(@jobs.index(prejob), job)
  end

  def self.print_sequence
    # Put sequence to the screen.
    puts "Sequence: #{@jobs.sequence}"
    self.get_job
  end

end
