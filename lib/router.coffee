Router.configure
  layoutTemplate: 'layout',
  loadingTemplate: 'loading',
  notFoundTemplate: 'notFound',

Router.route '/', name: 'home'

Router.route '/meetings/:_id',
  name: 'meeting',
  waitOn: ->
    Meteor.subscribe('current_meeting', @params._id)
  data: ->
    return _id: @params._id

# Router.onBeforeAction 'dataNotFound', only: 'meetingPage'
