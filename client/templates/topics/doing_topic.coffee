Template.doingTopic.helpers topic: ->
  return Topics.findOne({state:"doing"})
