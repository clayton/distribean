Template.doneTopics.helpers topics: ->
  return Topics.find({state:"done"})
