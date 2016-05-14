#= require_tree .

class @SilentListener

  @bindAll: (e) =>
    for name, cls of SilentListeners
      cls.bindSelf()

  @bindSelf: ->
    @instances ?= []
    $(@silentListenerSelector).each (i, el) =>
      unless $(el).data('silent-listener')?
        instance = new @($(el))
        $(el).data('silent-listener', instance)
        @instances.push instance

  constructor: (@el) ->
    @options = @mergeOptions()
    @instantiate()

  instantiate: =>

  mergeOptions: =>
    $.extend(true, {}, @_defaultOptions(), (@el.data('listener-options') || {}))

  _defaultOptions: => 
    {}

$ ->
  setTimeout SilentListener.bindAll, 0

@SilentListeners = {}
