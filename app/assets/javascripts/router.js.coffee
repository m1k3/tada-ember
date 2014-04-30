# For more information see: http://emberjs.com/guides/routing/

TadaEmber.Router.map ->
  @resource 'todos', path: '/', ->
    @route 'active'
    @route 'completed'

