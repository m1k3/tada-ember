# For more information see: http://emberjs.com/guides/routing/

TadaEmber.Router.map ->
  @resource 'todos', path: '/', ->
    @route 'active'
    @route 'completed'

TadaEmber.TodosRoute = Ember.Route.extend
  model: -> @store.find('todo')

TadaEmber.TodosIndexRoute = Ember.Route.extend
  setupController: -> @controllerFor('todos').set('filteredTodos', this.modelFor('todos'))

TadaEmber.TodosActiveRoute = Ember.Route.extend
  setupController: ->
    todos = @store.filter 'todo', (todo) ->
      !todo.get('isCompleted')

    @controllerFor('todos').set('filteredTodos', todos)

TadaEmber.TodosCompletedRoute = Ember.Route.extend
  setupController: ->
    todos = @store.filter 'todo', (todo) ->
      todo.get('isCompleted')

    @controllerFor('todos').set('filteredTodos', todos)
