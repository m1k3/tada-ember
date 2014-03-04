TadaEmber.TodosController = Ember.ArrayController.extend
  actions:
    createTodo: ->
      title = @get('newTitle').trim()
      return if !title

      todo = @store.createRecord 'todo',
        title: title
        isCompleted: false
      todo.save()

      @set('newTitle', '')

    clearCompleted: ->
      completed = @get('completed')
      completed.invoke('deleteRecord')
      completed.invoke('save')



  remaining: Ember.computed.filterBy('content', 'isCompleted', false)
  completed: Ember.computed.filterBy('content', 'isCompleted', true)

  allAreDone: ((key, value) ->
    if value != undefined
      @setEach('isCompleted', value)
      return value;
    else
      length = @get('length')
      completedLength = @get('completed.length')

      return length > 0 && length == completedLength
  ).property('length', 'completed.length')
