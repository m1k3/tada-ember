Ember.Handlebars.helper 'pluralize', (singular, count) ->
  inflector = Ember.Inflector.inflector;

  if count == 1
    singular
  else
    inflector.pluralize(singular)
