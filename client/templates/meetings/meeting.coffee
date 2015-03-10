Template.meeting.helpers
  meeting: ->
    meeting = Meetings.findOne(@_id)
    sortedToDoTopics = _.sortBy meeting.toDoTopics, (topic) ->
      return -topic.votes
    return _.extend(meeting, {sortedToDoTopics: sortedToDoTopics})

Template.meeting.events
  'submit form.new-topic': (evt) ->
    evt.preventDefault()
    evt.stopPropagation()

    topic =
      text: $(evt.target).find('[name=text]').val(),
      id: Random.id(),
      votes: 0

    id  = $(evt.target).find('[name=_id]').val()

    Meteor.call 'addNewItemToMeeting', id, topic, (error, response) ->
      $(evt.target).find('[name=text]').val("") unless error
