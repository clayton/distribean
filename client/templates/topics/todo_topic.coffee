Template.toDoTopic.helpers
  currentUserLiked: ->
    return true if _.contains(@votedBy, Session.get("currentUser"))
    return false

  currentUser: ->
    return Session.get('currentUser')

Template.toDoTopic.events
  'click .remove-topic': (evt) ->
    evt.preventDefault()
    evt.stopPropagation()

    topic = $(evt.target).attr("data-topic")
    id = $(evt.target).parents('.meeting.container').attr("id")

    if confirm("Are You Sure?")
      Meteor.call "removeTopicFromMeeting", id, topic, (error, response) ->
        $(evt.target).parent('.topic-container').fadeOut()

  'click .like-topic': (evt) ->
    evt.preventDefault()
    evt.stopPropagation()

    topic = $(evt.currentTarget).attr("data-topic")
    increment_by =  1
    increment_by = -1 if $(evt.currentTarget).hasClass('btn-info')

    Meteor.call "voteForTopic", topic, increment_by, Session.get('currentUser')

