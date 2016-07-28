require './test/test_helper'

class SledsheetTimesheetTest < Minitest::Test
  def test_exists
    assert Sledsheet::Timesheet
  end

  def test_it_returns_a_timesheet
    VCR.use_cassette('one_timesheet') do
      timesheet = Sledsheet::Timesheet.find(255)
      assert_equal Sledsheet::Timesheet, timesheet.class

      assert_equal 255, timesheet.id
      assert_equal "Lake Placid National Championships Race 2015-16 Men", timesheet.name
      assert_equal "2016-03-24T00:00:00.000Z", timesheet.date
      assert_equal "open", timesheet.status
    end
  end

  def test_it_returns_all_timesheets
    VCR.use_cassette('all_timesheets') do
      result = Sledsheet::Timesheet.all
      assert_equal 229, result.length

      assert result.kind_of?(Array)
      assert result.first.kind_of?(Sledsheet::Timesheet)
    end
  end
end
