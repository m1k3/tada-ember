TadaEmber.TodoController = Ember.ObjectController.extend
  isEditing: false

  bufferedTitle: Ember.computed.oneWay('title')


  actions:
    editTodo: -> @set('isEditing', true)
    doneEditing: ->
      bufferedTitle = @get('bufferedTitle').trim()
      if Ember.isEmpty(bufferedTitle)
        Ember.run.debounce(@, 'removeTodo', 0)
      else
        todo = @get('model')
        todo.set('title', bufferedTitle)
        todo.save()

      @set('bufferedTitle', bufferedTitle)
      @set('isEditing', false)

    cancelEditing: ->
      @set('bufferedTitle', @get('title'))
      @set('isEditing', false)

    removeTodo: -> @removeTodo()

  removeTodo: ->
    todo = @get('model')
    todo.deleteRecord()
    todo.save()

  saveWhenCompleted: (->
    @get('model').save()
  ).observes('isCompleted')
