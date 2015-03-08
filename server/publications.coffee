# Meteor.publish 'toDoTopics', ->
#   return Topics.find({state:"todo"})

# Meteor.publish 'doingTopic', ->
#   return Topics.findOne({state:"doing"})

# Meteor.publish 'doneTopics', ->
#   return Topics.find({state:"done"})

Meteor.publish 'current_meeting', (meetingId) ->
  check(meetingId, String);

  return Meetings.find({_id: meetingId})
