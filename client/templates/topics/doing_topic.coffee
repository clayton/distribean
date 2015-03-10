Template.doingTopic.events
  'click .next-topic': (evt) ->
    evt.preventDefault()
    evt.stopPropagation()

    id = $(evt.currentTarget).parents('.meeting.container').attr("id")

    Meteor.call "moveToDone", id
    Meteor.call "popTopicToDiscuss", id

  'click .five-minutes': (evt) ->
    evt.preventDefault()
    evt.stopPropagation()
    $(evt.currentTarget).addClass("disabled")

    done = new Date((new Date()).getTime() + (5 * 60 * 1000))

    clock = 600
    timeLeft = ->
      if clock > 0
        clock--
        Session.set "five-minute-time", clock
        $(evt.currentTarget).children('.clock').html(moment(done - (new Date())).format("m:ss"))
      else
        $(evt.currentTarget).children('.clock').html("5:00")
        $(evt.currentTarget).removeClass("disabled")

        Meteor.clearInterval interval

    interval = Meteor.setInterval(timeLeft, 1000)

  'click .two-minutes': (evt) ->
    evt.preventDefault()
    evt.stopPropagation()
    $(evt.currentTarget).addClass("disabled")

    done = new Date((new Date()).getTime() + (2 * 60 * 1000))

    clock = 120
    timeLeft = ->
      if clock > 0
        clock--
        Session.set "two-minute-time", clock
        $(evt.currentTarget).children('.clock').html(moment(done - (new Date())).format("m:ss"))
      else
        $(evt.currentTarget).children('.clock').html("2:00")
        $(evt.currentTarget).removeClass("disabled")

        Meteor.clearInterval interval

    interval = Meteor.setInterval(timeLeft, 1000)
