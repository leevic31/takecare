require 'test_helper'

class SchedulingConflictCheckerTest < ActiveSupport::TestCase
    test "overlap? returns true when there is an overlap" do
        start_time1 = Time.parse('2024-07-10 10:00:00')
        end_time1 = Time.parse('2024-07-10 12:00:00')
        start_time2 = Time.parse('2024-07-10 11:00:00')
        end_time2 = Time.parse('2024-07-10 13:00:00')
    
        assert SchedulingConflictChecker.overlap?(start_time1, end_time1, start_time2, end_time2)
    end

    test "overlap? returns false when there is no overlap" do
        start_time1 = Time.parse('2024-07-10 10:00:00')
        end_time1 = Time.parse('2024-07-10 12:00:00')
        start_time2 = Time.parse('2024-07-10 13:00:00')
        end_time2 = Time.parse('2024-07-10 14:00:00')
    
        refute SchedulingConflictChecker.overlap?(start_time1, end_time1, start_time2, end_time2)
    end

    test "overlap? returns true when there is an exact overlap" do
        start_time1 = Time.parse('2024-07-10 10:00:00')
        end_time1 = Time.parse('2024-07-10 12:00:00')
        start_time2 = Time.parse('2024-07-10 10:00:00')
        end_time2 = Time.parse('2024-07-10 12:00:00')
    
        assert SchedulingConflictChecker.overlap?(start_time1, end_time1, start_time2, end_time2)
    end

    test "overlap? returns false when intervals touch but do not overlap" do
        start_time1 = Time.parse('2024-07-10 10:00:00')
        end_time1 = Time.parse('2024-07-10 12:00:00')
        start_time2 = Time.parse('2024-07-10 12:00:00')
        end_time2 = Time.parse('2024-07-10 14:00:00')
    
        refute SchedulingConflictChecker.overlap?(start_time1, end_time1, start_time2, end_time2)
    end

    test "overlap? returns true when there is a nested interval" do
        start_time1 = Time.parse('2024-07-10 9:00:00')
        end_time1 = Time.parse('2024-07-10 13:00:00')
        start_time2 = Time.parse('2024-07-10 10:00:00')
        end_time2 = Time.parse('2024-07-10 12:00:00')
    
        assert SchedulingConflictChecker.overlap?(start_time1, end_time1, start_time2, end_time2)
    end
end
