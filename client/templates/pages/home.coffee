Template.home.events
  'submit form': (evt) ->
    evt.preventDefault()

    new_meeting =
      toDoTopics:[],
      doingTopic: null,
      doneTopics:[]

    new_meeting._id = Meteor.call 'newRandomMeeting', new_meeting, (error, response)->
      Router.go 'meeting', _.extend(new_meeting, {_id: response})

