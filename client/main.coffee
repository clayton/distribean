if Meteor.isClient
  Session.setDefault("currentUser", Random.id())
