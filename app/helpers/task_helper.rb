module TaskHelper

  def deadline_check
    if params[:deadline_check] == "1"
    @task.deadline = Time.zone.local(params[:deadline]["date(1i)"].to_i, params[:deadline]["date(2i)"].to_i, params[:deadline]["date(3i)"].to_i,
                                     params[:deadline]["date(4i)"].to_i, params[:deadline]["date(5i)"].to_i )
    end
  end

  def status(state)
    case state
    when 1
      "TODO"
    when 2
      "DOING"
    when 3
      "DONE"
    else
      "不明"
    end
  end
end
