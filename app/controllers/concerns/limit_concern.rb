module LimitConcern
  def limit_response(params, messages)
    limit_number = params[:number_messages]
    limit_days = params[:days_ago]

    if limit_days
      messages.select { |msg| msg.created_at > limit_days.to_i.days.ago }.to_json
    elsif limit_number
      messages.last(limit_number.to_i).to_json
    else
      messages.to_json
    end
  end
end