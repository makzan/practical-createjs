# a global app object.
this.exampleApp ?= {}

# alias
cjs = createjs
setting = this.exampleApp.setting

class App
  # Entry point.
  constructor: ->
    console.log "Welcome to my portfolio."
    @canvas = document.getElementById("app-canvas")
    @stage = new cjs.Stage(@canvas)

    cjs.Ticker.setFPS 60

    # make sure the stage refresh drawing for every frame.
    cjs.Ticker.addEventListener "tick", @stage


# Start the app
new App()
