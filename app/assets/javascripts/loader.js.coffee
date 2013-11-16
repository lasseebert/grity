window.GRITY = {}
GRITY.javascripts = {}

GRITY.exec = (controller, action) ->
  action = "init" unless action?
  controller = "common" unless controller?
  scripts = GRITY.javascripts[controller]?[action] || []
  script() for script in scripts

# Use this to register script on action
# action and controller are not required
# Can be called with (controller, action, script) or (pontroller, script) or (script)
GRITY.register = (controllers, actions, script) ->
  unless script?
    if actions
      script = actions
      actions = "init"
    else
      script = controllers
      controllers = "common"
      actions = "init"

  if controllers instanceof Array
    GRITY.register controller, actions, script for controller in controllers
    return
  if actions instanceof Array
    GRITY.register controllers, action, script for action in actions
    return

  GRITY.javascripts[controllers] ||= {}
  GRITY.javascripts[controllers][actions] ||= []
  GRITY.javascripts[controllers][actions].push script

GRITY.init = ->
  body = $ document.body
  controller = body.data "controller"
  action = body.data "action"

  # Call GRITY.common.init
  GRITY.exec()

  # Call GRITY.<controller>.init
  GRITY.exec(controller)

  # Call GRITY.<controller>.<action>
  GRITY.exec(controller, action)

# Init when dom is ready (normal page load) _and_ when TurboLinks loads a page (page:load)
ready = GRITY.init
$(document).ready(ready)
$(document).on('page:load', ready)
