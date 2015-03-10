Template.nextTopic.events
  'click .next-topic': (evt) ->
    evt.preventDefault()
    evt.stopPropagation()

    id = $(evt.currentTarget).parents('.meeting.container').attr("id")

    Meteor.call "popTopicToDiscuss", id
