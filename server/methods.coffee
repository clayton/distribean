Meteor.methods
  newRandomMeeting: (meeting) ->
    return Meetings.insert(meeting)

  addNewItemToMeeting: (id, topic) ->
    return Meetings.update {_id: id}, $push: toDoTopics: topic

  removeTopicFromMeeting: (id, topic) ->
    return Meetings.update {_id: id}, $pull: toDoTopics: {id: topic}

  voteForTopic: (topic, increment_by, currentUser) ->
    if increment_by > 0
      return Meetings.update { 'toDoTopics.id': topic },
              '$push': 'toDoTopics.$.votedBy': currentUser
              '$inc': 'toDoTopics.$.votes': increment_by

    if increment_by < 0
      return Meetings.update { 'toDoTopics.id': topic },
              '$pull': 'toDoTopics.$.votedBy': currentUser
              '$inc': 'toDoTopics.$.votes': increment_by
