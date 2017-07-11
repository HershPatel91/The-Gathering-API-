class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user, :message, :datetime

  def datetime
  	stamp = @object.created_at
  	timestamp = stamp.localtime
  	time = timestamp.strftime('%T')
  	hour = time.slice(0,2).to_i
  	minutes = time.slice(3,2)
  	format_time = ""
  	if hour < 12
  		format_time = "#{hour}:#{minutes} AM"
  	else
  		format_time = "#{hour-12}:#{minutes} PM"
  end
  	date = timestamp.strftime('%b %d %Y')
  	date_time = "#{date} #{format_time}"
  
  return date_time
 end

end
