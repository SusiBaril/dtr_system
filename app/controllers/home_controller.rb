class HomeController < ApplicationController
  def index
    @last_attendance = Attendance.where(date: Date.today, time_out: nil).last
    @timed_in = @last_attendance.present?
    @start_time_ms = @last_attendance&.time_in&.to_i * 1000 if @timed_in
    @attendances = Attendance.where(date: Date.today).order(created_at: :desc)
  end

  def time_in
    Attendance.create(date: Date.today, time_in: Time.current.in_time_zone("Asia/Manila"))
    redirect_to root_path
  end

  def time_out
    attendance = Attendance.where(date: Date.today, time_out: nil).last
    if attendance
      time_out_now = Time.current.in_time_zone("Asia/Manila")
      attendance.update(time_out: time_out_now)
      elapsed_seconds = (time_out_now - attendance.time_in.in_time_zone("Asia/Manila")).to_i
      rendered_hours = elapsed_seconds / 3600.0
      attendance.update(rendered_hours: rendered_hours)
    end
    redirect_to root_path
  end
end
