module TasksHelper
    
    
 def time_remaining_for(task_timestamp)
   days_left = (7 - (Date.today - task_timestamp.to_date)).to_i
   "#{days_left} days"
 end
    
end
