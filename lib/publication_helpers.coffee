currentMeeting = (id) ->
  return Meeting.find({_id: id})
