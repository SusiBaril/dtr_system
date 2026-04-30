class HomeController < ApplicationController
  def index
    @last_attendance = Attendance.where(date: Date.current, time_out: nil).last
    @timed_in = @last_attendance.present?
    @start_time_ms = @last_attendance&.time_in&.to_i * 1000 if @timed_in
    @attendances = Attendance.where(date: Date.current).order(created_at: :desc).limit(5)
    @remaining_hours = 0 + Attendance.where(date: Date.current.beginning_of_month..Date.current.end_of_month).sum(:rendered_hours).to_f
    if @timed_in
      elapsed_hours = (Time.current - @last_attendance.time_in) / 3600.0
      @remaining_hours -= elapsed_hours
    end
  end

  def time_in
    Attendance.create(date: Date.current, time_in: Time.current.in_time_zone("Asia/Manila"))
    redirect_to root_path
  end

  def time_out
    attendance = Attendance.where(date: Date.current, time_out: nil).last
    if attendance
      time_out_now = Time.current.in_time_zone("Asia/Manila")
      attendance.update(time_out: time_out_now)
      elapsed_seconds = (time_out_now - attendance.time_in.in_time_zone("Asia/Manila")).to_i
      rendered_hours = elapsed_seconds / 3600.0
      attendance.update(rendered_hours: rendered_hours)
    end
    redirect_to root_path
  end

  def rendered_hours
    attendance = Attendance.where(date: Date.current).last
    if attendance && attendance.rendered_hours
      render json: { rendered_hours: attendance.rendered_hours }
    else
      render json: { rendered_hours: 0 }
    end
  end
end
