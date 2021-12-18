module EventsHelper
  require 'google/apis/calendar_v3'
  require 'google/api_client/client_secrets'

  def google_event(event)
    @event = Event.find(event.id)
    user_email = @event.user.email
    expert_email = current_user.email
    @attendees = "#{user_email}, #{expert_email}".split(',').map { |t| { email: t.strip } }
    @client = get_google_calendar_client current_user
    if @event.online?
      get_online
    else
      get_offline
    end
  end

  def get_offline
    event = Google::Apis::CalendarV3::Event.new({
                                                  summary: @event.comment,
                                                  description: "Пациент: #{@event.user.card.full_name}",
                                                  start: {
                                                    date_time: @event.start_time.to_datetime
                                                  },
                                                  end: {
                                                    date_time: @event.start_time.to_datetime + 1.hour
                                                  },
                                                  attendees: @attendees
                                                })
    new_event = @client.insert_event('primary', event, conference_data_version: 1)
    [new_event.html_link]
  end

  def get_online
    event = Google::Apis::CalendarV3::Event.new({
                                                  summary: @event.comment,
                                                  description: "Пациент: #{@event.user.card.full_name}",
                                                  start: {
                                                    date_time: @event.start_time.to_datetime
                                                  },
                                                  end: {
                                                    date_time: @event.start_time.to_datetime + 1.hour
                                                  },
                                                  attendees: @attendees,
                                                  conference_data: Google::Apis::CalendarV3::ConferenceData.new(
       create_request: Google::Apis::CalendarV3::CreateConferenceRequest.new(
       request_id: SecureRandom.alphanumeric,
       conference_solution_key: Google::Apis::CalendarV3::ConferenceSolutionKey.new(
        type: 'hangoutsMeet'
      )
     )
     )
                                                })
    new_event = @client.insert_event('primary', event, conference_data_version: 1)
    [new_event.html_link, new_event.hangout_link]
  end

  def get_google_calendar_client(current_user)
    client = Google::Apis::CalendarV3::CalendarService.new
    secrets = Google::APIClient::ClientSecrets.new({
                                                     'web' => {

                                                       'access_token' => current_user.access_token,
                                                       'refresh_token' => current_user.refresh_token,
                                                       'client_id' => ENV['GOOGLE_CLIENT_ID'],
                                                       'client_secret' => ENV['GOOGLE_CLIENT_SECRET']
                                                     }
                                                   })
    client.authorization = secrets.to_authorization
    client.authorization.grant_type = 'refresh_token'
    client.authorization.fetch_access_token!
    client.authorization
    client
  end

  def available_time(expert, time)
    day_of_week = time.to_datetime.strftime('%A').downcase
    start_time = expert.send("hw_start_#{day_of_week}").to_i
    end_time = expert.send("hw_end_#{day_of_week}").to_i
    set_time = (start_time..end_time).to_a
    time_now = (0..Time.now.hour).to_a
    event_time = get_event(expert, time)
    availiabe = if Time.now.strftime('%Y-%m-%d') == time
                  set_time - event_time - time_now
                else
      set_time - event_time
                end
    arr = {}
    case day_of_week
    when 0
      arr[0] = availiabe
    when 1
      arr[1] = availiabe
    when 2
      arr[2] = availiabe
    when 3
      arr[3] = availiabe
    when 4
      arr[4] = availiabe
    when 5
      arr[5] = availiabe
    else
      arr[6] = availiabe
    end
  end

  def get_event(expert, time)
    arr = []
    events = expert.events
                   .where(start_time: time.to_datetime.beginning_of_day...time.to_datetime.end_of_day)
                   .where(status: %i[approve pending])
    events.each do |ev|
      arr << ev.start_time.hour
    end
    arr.flatten.uniq
  end
end
