class JobsArray < Array
  def insert_or_push(ary)
    if ary[0].nil?
      # There's no prejob dependency
      if self.index(ary[1]).nil?
        # Job doesn't exist
        self.push(ary[1])
      else
        Errors.raise :job_already_added
        Jobs.get_job
      end
    else
      # There's prejob dependency
      if self.index(ary[0]).nil? && self.index(ary[1]).nil?
        # There's no prejob nor job exist
        ary.each{|i| self.push(i)}
      elsif self.index(ary[0]).nil?
        # Prejob doesn't exist but job do
        self.insert(self.index(ary[1]), ary[0])
      elsif self.index(ary[1]).nil?
        # Prejob exists but job doesn't
        self.insert(self.index(ary[0]) + 1, ary[1])
      else
        # Both prejob and job exist"
        if self.index(ary[1]) > self.index(ary[0])
          Errors.raise :jobs_already_added
          Jobs.get_job
        else
          Errors.raise :circular_dependency
          Jobs.get_job
        end
      end
    end
  end

  def sequence
    self.join("")
  end
end