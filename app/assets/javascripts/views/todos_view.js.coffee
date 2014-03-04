TadaEmber.TodosView = Ember.View.extend
  focusInput: (-> @.$('#new-todo').focus() ).on('disInsertElement')
