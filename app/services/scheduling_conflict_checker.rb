class SchedulingConflictChecker
    def self.overlap?(start_time1, end_time1, start_time2, end_time2)
        (start_time1 < end_time2) && (end_time1 > start_time2)
    end
end
