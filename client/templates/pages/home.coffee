Template.home.events
  'submit form': (evt) ->
    evt.preventDefault()

    new_meeting =
      toDoTopics:[],
      doingTopic: null,
      doneTopics:[]

    new_meeting._id = Meetings.insert(new_meeting)
    Router.go 'meeting', new_meeting
