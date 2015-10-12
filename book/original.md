














# Project 2 – Rain or Not?

In this project, we create an app that helps the user knows if they need to begin the umbrella each day. It serves one single purpose which fetches the weather. In this example, we only care about the rainy day and the sunny say. In the future, you may modify it to support more weather conditions such as windy and snow days.

Before we get started into the project, here is the screenshot of what we are going to build. You can also try the project demo with the following link. I recommend you go try it so you can map the code with the app that we are building.

![Screenshot of the app example](images/rain-or-not-screenshot.png)

http://mak.la/demo-rain-or-not



### Why this project is awesome

We have created an information based app in last example. In this example, we will explore how we can separate the logic into data, view and controlling logic. This is known as MVC, modal-view-controller.

We try to separate the logic, data and the view. This ensues that each module of code is minimal and so they are easy to maintain.


## Mission Checklist

We are going to replace the canvas-based content into DOM elements.

1. Setup the project
2. Data
3. Mocking API
4. View
5. Adding Canvas
6. Moving the Canvas in
7. Aligning with FlexBox
8. Device Rotation


{title="The core logic of the app"}
	;(function($){
	$.getJSON('http://api.openweathermap.org/data/2.5/weather?q=Macao,MO&callback=?', function(data){
	    console.log(data);
	  });
	}).call(this, jQuery);

## 1. Setup the project



### Time for Action

1. The `index.html` file.

	{title="index.html"}
		<!DOCTYPE html>
		<html lang='en'>
		  <head>
		    <meta charset='utf-8'>
		    <meta name='viewport' content='width=device-width, initial-scale=1'>
		    <meta name='apple-mobile-web-app-capable' content='yes'>
		    <title>Rain or Not</title>
		    <link rel='stylesheet' href='styles/app.css'>
		  </head>
		  <body>
		    <div id='app'>
		      <div id='main' class='page loading'>
		        <header>Macao</header>
		        <canvas id='app-canvas' class='out' width='300' height='300'>
		          <!-- fallback content -->
		          <img class='rainy-only status' src='http://placehold.it/300x300&text=rainy' alt='rainy'>
		          <img class='sunny-only status' src='http://placehold.it/300x300&text=sunny' alt='sunny'>
		        </canvas>
		        <p class='description rainy-only'>Bring your umbrella</p>
		        <p class='description sunny-only'>Have a nice day!</p>
		      </div>
		    </div>

		    <script src='//code.jquery.com/jquery.min.js'></script>
		    <script src='//code.createjs.com/easeljs-0.7.1.min.js'></script>
		    <script src='//code.createjs.com/tweenjs-0.5.1.min.js'></script>
		    <script src='//code.createjs.com/movieclip-0.7.1.min.js'></script>
		    <script src='scripts/rain-or-not-lib.js'></script>
		    <script src='scripts/app.js'></script>
		    <script src='//cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js'></script>
		  </body>
		</html>


2. The `app.coffee` file.

	{title="app.coffee"}
		this.rainOrNot = {}

		class App
		  constructor: ->
		    console.log "Do you need your umbrella today?"

		    @refresh()


		  refresh: ->
		    data = new Data()
		    view = new View()
		    data.fetch (is_rainy) ->
		      view.update(is_rainy)

3. Make sure we invoke the App:
	{title="app.coffee"}
		new App()





### What just happened?



## 2. Data module

The data logic is responsible to fetch the data from the source and parse the data.



### Time for Action

1. We create a new class for the Data module.

	{title="app.coffee"}
		class Data
		  constructor: ->
		    @api = 'http://api.openweathermap.org/data/2.5/weather?q=Macao,MO'
		  fetch: (callback) ->

		    $.getJSON @api, (data) ->
		      console.log(data)

		      code = data.weather[0].id + "" # force to string

		      # rainy code all start at 5
		      if code[0] == '5'
		        callback(true)
		      else
		        callback(false)



## 3. Mocking API

We need to use different API response to test our logic.

Mocking an API usually means that we create a static JSON file and put it somewhere that the development app can access. But this could be more automatic if we have lots of mock API to create. A tool named [mockable](http://mockable.io) comes to help.

I created 2 canned responses, sunny and rainy, with the following URL. The response JSON is copied from the source, OpenWeather.

	http://demo5385708.mockable.io/weather?sunny
	http://demo5385708.mockable.io/weather?rainy




### Time for Action

1. In the `Data` class, we add a mock API to test different API response. Add the following code to override the API url.

	{title="app.coffee"}
		class Data
		  constructor: ->
		    @api = 'http://api.openweathermap.org/data/2.5/weather?q=Macao,MO'

		    # mock
		    @api = 'http://demo5385708.mockable.io/weather?rainy'
		  ...


## 4. View

Defining the CSS styles.

	.loading {
	  background-image: url(../images/loading.png) center center no-repeat;
	}

	.sunny {
	  background: #B8DCF1
	}
	.rainy {
	  background: #9FB6C4;
	}

The main view that controls DOM elements and the more-specific View objects, such as `Background` and `CanvasView`

	class View
	  constructor: ->
	    $('.status').hide()
	    $('.description').hide()

	    @canvasView = new CanvasView()
	    @canvasView.reset()
	    @background = new Background()
	  update: (is_rainy=true)->
	    $('.loading').removeClass('loading')
	    @canvasView.moveIn()
	    if is_rainy
	      $('.rainy-only').show()
	      $('.sunny-only').hide()
	      @canvasView.showRainy()
	      @background.setRainyBackground()
	    else
	      $('.rainy-only').hide()
	      $('.sunny-only').show()
	      @canvasView.showSunny()
	      @background.setSunnyBackground()

Controlling the Background

	class Background
	  constructor: ->
	    @element = $('body')
	  setSunnyBackground: -> @element.addClass('sunny')
	  setRainyBackground: -> @element.addClass('rainy')



## 5. CanvasView

	class CanvasView
	  constructor: ->
	    cjs = createjs
	    @canvas = document.getElementById("app-canvas")
	    @stage = new cjs.Stage(@canvas)

	    cjs.Ticker.setFPS 60
	    cjs.Ticker.addEventListener "tick", @stage
	    cjs.Ticker.addEventListener "tick", @tick

	    @retinalize()
	  tick: =>
	    @applyDeviceRotation()

	  retinalize: ->
	    CanvasView.width ?= @canvas.width
	    CanvasView.height ?= @canvas.height

	    @canvas.style.width = CanvasView.width + 'px'
	    @canvas.style.height = CanvasView.height + 'px'
	    @canvas.width = CanvasView.width * 2
	    @canvas.height = CanvasView.height * 2
	    @stage.scaleX = @stage.scaleY = 2

	  moveIn: -> $(@canvas).removeClass('out').addClass('in')
	  reset: -> $(@canvas).removeClass().addClass('out')

	  showRainy: ->
	    @icon = new lib.Rainy()
	    @stage.addChild @icon
	  showSunny: ->
	    @icon = new lib.Sunny()
	    @stage.addChild @icon



## 6. Moving the canvas in





### Time for Action

This is a subtle effect that we move the canvas icon from bottom to the center of the viewport by using CSS3 transition.

`app.css` file

	.out {
	  transform: translateY(100%);
	  opacity: 0;
	}

	.in {
	  transition: all .75s cubic-bezier(0.140, 0.460, 0.160, 1.210);
	  transform: translateY(0%);
	  opacity: 1;
	}

The transition may fail if the data is cached without loading. We need to add a little delay to make the CSS transition work.

	class App
	  constructor: ->
	    console.log "Do you need your umbrella today?"

	    setTimeout =>
	      @refresh()
	    , 500



## 7. Aligning with FlexBox

Flexbox is the next hot topic on layout. It’s draft was first published in 2009 and has reach a relatively stable status now, after 5 years of discussions and name changes.

In the step, we will make the app frame a flexbox container and layout our user interface elements at the center of the screen, vertically.



### Time for action

1. Add the following to the CSS to make the items align center vertically.

	{title="app.css"}
		/* Flexbox */
		html, body, #app, .page {
		  height: 100%;
		}
		.page {
		  flex-direction: column;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		}

I recommend reading the [full guide to FlexBox](http://css-tricks.com/snippets/css/a-guide-to-flexbox/). Or you may check the latest working draft on W3C website.

http://www.w3.org/TR/css-flexbox-1/

## 8. Device Rotation

In this step, we will add a motion effect where the rainy and sunny icon slightly moves based on the device rotation.

This is done by listening to the `DeviceOrientationEvent` and use the rotation degree to control the icon.

### Time for Action

Let’s work on the following steps to create a motion effects based on the rotation degree of the device.

1. We create a new class which keep storing the latest device rotation. The value is from the Gyroscope where axises are represented in `alpha`, `beta`, `gamma`.

	{title="app.coffee"}
		class DeviceRotation
		  constructor: ->
		    DeviceRotation.a = DeviceRotation.b = DeviceRotation.g = 0

		    # gyroscope
		    $(window).on 'deviceorientation', (e)->
		      DeviceRotation.a = @a = e.originalEvent.alpha
		      DeviceRotation.b = @b = e.originalEvent.beta
		      DeviceRotation.g = @g = e.originalEvent.gamma
		      $('#debug').text("#{@a} #{@b} #{@g}")


2. We need to apply the value. In the `CanvasView` class, we use the device rotation to offset the sunny and rainy icons.

	{title="app.coffee"}
		applyDeviceRotation: ->
		  a = DeviceRotation.a
		  b = DeviceRotation.b
		  g = DeviceRotation.g

		  @icon.front.x = CanvasView.width/2 + g/10
		  @icon.front.y = CanvasView.height/2 + b/10

		  @icon.back.x = CanvasView.width/2 + g/5
		  @icon.back.y = CanvasView.height/2 + b/5


3. Now the App constructor becomes:

	{title="app.coffee"}
		class App
		  constructor: ->
		    console.log "Do you need your umbrella today?"

		    setTimeout =>
		      @refresh()
		    , 500

		    $('body').click => @refresh()

		    new DeviceRotation()



### What just happened?

The `#debug` element is used to observe the value of the gyroscope. By printing out the values, we can hold the device on hand, and then rotate the device into different directions and observe how the tilting changes the three rotation axises. After we get what we need from the numbers, we can hide it or even delete it. Make sure these debug information is not visible when we deploy the app in production environment.

#### Device Orientation Event

For more information on using the 3 axises of the device rotation, please check the Apple Developer documentation:

http://mak.la/apple-device-orientation-event

I created a utility that inspects the device rotation value and prints them out nicely.

https://play.google.com/store/apps/details?id=net.makzan.gyroinspcetor

You may use this tool to inspect the value you want by holding the device at the target rotation.

#### Controlling Flash instance

When we set an instance name in the Flash movie clip which being exported to canvas, we can actually access that instance from the Javascript. This gives a huge convenient way to manipulated with the exported graphics.

For example, in this example, we listen to the drive rotating events and changes the movement offset of both the front and back instance of the weather symbol. The `front` and `back` instance are already defined in the flash and exported to the Javascript.


## Summary

In this project, we learnt to define our logic into different modules for easier maintenance. The logic is divided into data querying, view rendering and controller that bridges between data and view.

We also learned to control pre-defined symbol instances that was exported from Adobe Flash.

At last, we listen to the device orientation to get the 3 axis value of device rotation.

# Project 3 – Solar System

A\> This chapter is not yet completed and it requires further re-written.

In this project, we are going to create a tool that presents our solar system.

The system is constructed by HTML DOM elements and CSS transform and transition.

## Why is this project awesome?

By following the project steps, you will learn how to scroll the view in a parallax effect. This effect created an illusion of depth. That's based on our real world that's in perspective view. Things aren't look the same at different distances. Things that's far away from us looks smaller and moves slower to us. By creating the same scaling and movement at different layers, we can create similar depth feeling.



## Preparation

Before we get started, we want to include one more Gulp plugin.

If you are using an existing project example, you may run the following command to add the `gulp-sass` compiler to the project.

	npm install gulp-sass --save-dev

If you are working on a new folder, you may download the following skeleton which contains the basic project file structure and the `package.json` file.

	http://mak.la/cjs-skeleton

Make sure to run `npm install --save-dev` after you download the skeleton code.

SCSS is a kind of CSS preprocessor. Preprocessor means that we write another syntax to express our css rules and then compile it into css. The beauty of Scss is that it is like css. If you don't use any of the Scss specific syntax, the code is actually valid css file.

## HTML

This is the HTML skeleton.

	<div id='app'>
	  <div id='solar-system' class='focus-earth'>
	    <div class='layer deep-bg'></div>
	    <div class='layer bg'></div>
	    <div class='layer planets'>
	      <!-- each planet here -->
	    </div>
	  </div>
	  <div class='info-panel'>
	    <!-- Info text here -->
	  </div>
	  <div class='buttons'>
	    <!-- button to focus on for every planet -->
	  </div>

	  <div class='detail-panel out'>
	    <!-- pop up panel with detail information on every planet -->
	  </div>
	</div>

Almost the elements are position absolute. The `#app` element is relative position to act as the relative coordinate for all the absolute position child elements. They all overlap together. Then we adjust the transform and too left bottom right to control their position.

I\> We use absolute position when we want the layers (groups) to overlap together.

The solar system had three layers. The deep background, background and the planets. The two background layers is essential to create a space movement illusion.

I\> In the future, there may be additional layers such as the sun and a front layer of dust.

Basic CSS:

	* {
	  box-sizing: border-box;
	}

	body, div, ul, li, h1, h2, h3, p {
	  margin: 0;
	  padding: 0;
	}

	img {
	  max-width: 100%;
	}

	html, body, #app, #solar-system {
	  width: 100%;
	  height: 100%;
	}


	#app {
	  position: relative;
	  overflow: hidden;
	}

## Planet buttons

HTML:

	<div class='buttons'>
	    <a href='#mercury' class='focus-button'>Mercury</a>
	    <a href='#venus' class='focus-button'>Venus</a>
	    <a href='#earth' class='focus-button'>Earth</a>
	    <a href='#mars' class='focus-button'>Mars</a>
	    <a href='#jupiter' class='focus-button'>Jupiter</a>
	    <a href='#saturn' class='focus-button'>Saturn</a>
	    <a href='#uranus' class='focus-button'>Uranus</a>
	    <a href='#neptune' class='focus-button'>Neptune</a>
	  </div>

CSS:

	/* User Inteface */
	.buttons {
	  position: absolute;
	  height: 100%;
	  right: 0;

	  display: flex;
	  flex-direction: column-reverse;

	  a {
	    display: block;
	    flex: 1;

	    text-decoration: none;
	    color: #555;

	    line-height: 50px;

	    &.active {
	      color: white;
	    }
	  }
	}

The button is laid out using the flexbox to ensure they are evenly distributed.

The nested scope in the preprocessor allows us to group related styles together. We can modularize the styles to specific part of the app.

## The solar system

	$space-height: 13000px;
	$bg-z: 10;
	$deep-bg-z: 30;

	#solar-system {
	  position: absolute;
	  overflow: hidden;
	  transform-origin: 0 0;
	}


	.layer {
	  position: absolute;
	  transition: all 1.5s ease-out;
	}

	.deep-bg {
	  width: 100%;
	  height: $space-height;
	  background: black url(../images/deep-bg.jpg);
	}

	.bg {
	  width: 100%;
	  height: $space-height;
	  background: url(../images/bg.jpg);
	  opacity: .3;
	}

	.planet {
	  position: absolute;
	  img {
	    max-width: 80px;
	  }
	}

Those preprocessors usually allow us to define variable and expressions. For example, we defined several variables for our solar system. They are the height of the space view. The virtual Z index of the layers.


We don't need the height of the space view if we order the planets from top to bottom.

We need the height because we are calculating the position from the bottom.

## Showing the planets

The value of the planet is based on the average distance the real planet are away from the sun. We have a multiplier to adjust the scale.

	$planets: "mercury" "venus" "earth" "mars" "jupiter" "saturn" "uranus" "neptune";
	$distances:  57*2px 108*2px 150*2px 228*2px 779*2px 1430*2px 2880*2px 4500*2px;
	$x-positions: 30vw 15vw 45vw 50vw 35vw 60vw 25vw 56vw;

	@for $i from 1 through length($planets) {
	  $name: nth($planets, $i);
	  $distance: nth($distances, $i);
	  $x-position: nth($x-positions, $i);
	  .#{$name} {
	    transform: translateX($x-position) translateY(calc(#{$space-height} - #{$distance}));
	  }

	  ...
	}


The looping expressions allows us to define similar css rules without explicitly typing all of them. For example, we use loop and a list to iterate all 8 planets rules and their styles when focused.

Scss list is useful when we cant express the calculation with just the looping index. For example, we want to iterate the name of the 8 planets, so we use a list to store the planet name and use it to define the class based on these names.

You may think that list is kind of array in programing language. Actually Scss even has a nested list like a 2 dimension array.

There are some utility functions to help us manipulate the scss list. The most common one is the `nth` function where we get the value based on the index, usually within an for loop. The `length` function helps us to define the ending condition if the for loop.

The `calc` function in css allows is to express a calculation as a property value.

I\> Please note that css does support using expression as property value, it is the calc function. And css also supports variable. But variable are supported in Firefox only right now. So we have to mix the Scss variable and the css calc. By mixing them, we need to use the `#{}` syntax to distinguish the Scss expression and the css expression.

	@for $i from 1 through length($planets) {
	  $name: nth($planets, $i);
	  $distance: nth($distances, $i);

	  ...

	  #solar-system.focus-#{$name} {
	    .planets.layer {
	      transform: translateY(calc(-#{$space-height} + #{$distance} + 40vh));
	    }
	    .bg.layer{
	      transform: translateY(calc((-#{$space-height} + #{$distance} + 40vh) / #{$bg-z}));
	    }
	    .deep-bg.layer{
	      transform: translateY(calc((-#{$space-height} + #{$distance} + 40vh) / #{$deep-bg-z}));
	    }
	  }
	}

The focus style explicitly moves the 3 layers into different transform Y based on the calculation.

By toggling different focus styles on different planets, the 3 layers move in different speeds and thus created the parallax effect.



## Detail Panel

	<div class='detail-panel out'>
	  <div id='tab-mercury' class='tab'>
	    <h1>Mercury</h1>
	    <img src='images/mercury.jpg' alt='Mercury'>
	    <p><small>Photo by NASA. Public Domain.</small></p>
	    <p><small>Tap anywhere to close</small></p>
	  </div>
	  <!-- other planets’ detail go here -->
	</div>




# Project 4 – Countries Area

In this project, we create an app that draws a chart by using canvas and CreateJS.

This example demonstrated both multiple select list and single item select list.

The multiple select list is done via check box with array as name. The single item selection list is done by using the radio buttons.

The beauty of using these two basic elements is that it works perfect without any css and Javascript. The css and Javascript is here to enhance the select list. But the core thing still works without these enhancement.




## Why is this project awesome?

This project you will learn tobmake momentum list. Learn to customize the radio and checkbox. Learn to draw basic chart using the create js library. Also learn to use flex box to create the entire app layout.

The project is divided into the following steps.

1. Building the app layout with flex
2. Listing the countries data
3. Basic list selection and calculation
4. Styling the radio and checkbox list
5. Drawing the chart
6. Adding the info panel and global app style










## Preparing the project

Before we get started the project, let’s prepare several files. They are:

1. Gulpfile.coffee
2. retinalize.coffee
3. shape.coffee




{title="Gulpfile.coffee"}
	gulp.task 'js', ->
	  gulp.src [
	    './app/scripts/data.coffee'
	    './app/scripts/retinalize.coffee'
	    './app/scripts/shape.coffee'
	    './app/scripts/chart.coffee'
	    './app/scripts/view.coffee'
	    './app/scripts/app.coffee'
	  ]
	  .pipe coffee()
	  .pipe concat 'app.js'
	  .pipe gulp.dest './app/scripts/'

We make the retinalize class is ready.

{title="retinalize.coffee”}
	this.utility ?= {}

	this.utility.retinalize = (stage, updateCSS=true) ->
	  canvas = stage.canvas
	  utility.originalCanvasWidth = canvas.width
	  utility.originalCanvasHeight = canvas.height

	  return unless window.devicePixelRatio

	  ratio = window.devicePixelRatio

	  height = canvas.getAttribute('height')
	  width = canvas.getAttribute('width')

	  canvas.setAttribute 'width', Math.round( width * ratio )
	  canvas.setAttribute 'height', Math.round( height * ratio )

	  if updateCSS
	    canvas.style.width = width+"px"
	    canvas.style.height = height+"px"

	  stage.scaleX = stage.scaleY = ratio

Then we have another utility class that draws rectangle shape.

{title="shape.coffee"}
	# alias
	cjs = createjs

	class this.DefaultShape extends cjs.Shape
	  constructor: (@options={}) ->
	    super()
	    @initialize()
	    @applyOptions()
	  applyOptions: ->
	    @options.fillColor ?= null
	    @options.strokeColor ?= null
	    @options.strokeWidth ?= 1
	    @options.width ?= 100
	    @options.height ?= 100
	    @options.x ?= 0
	    @options.y ?= 0
	    return @options

	# Shapes
	# options:
	# width, height, fillColor, strokeColor, strokeWidth
	class this.RectShape extends this.DefaultShape
	  constructor: (options={}) ->
	    super(options)
	    @graphics
	      .setStrokeStyle @options.strokeWidth
	      .beginFill @options.fillColor
	      .beginStroke @options.strokeColor
	      .drawRect 0, 0, @options.width, @options.height
	    @x = @options.x
	    @y = @options.y


We’ll need the `RectShape` when we draw the chart in canvas.



There is basic CSS reset in the `app.css` file.

{title="app.css"}
	/* Basic reset */
	html, body, p, ul, li, h1, h2, h3, div {
	  margin: 0;
	  padding: 0;
	}

	* {
	  box-sizing: border-box;
	}

## Step 1 – Building the app layout with flex

In this task, we build the basic layout by using the flex box. We will create our own minimal flex layout styles. Every elements with class `.container` will treat as flex display. All their children would have `flex:1 1 auto` by default, unless `.shrink` class presents.

### Time for Actions

Let’s follow the steps to create the app layout by using flex box.


1. In the `#app` in HTML, we add the following elements.

	{title="index.html"}
		<div id='app' class='container vertical'>
		  <div class='charts container'>
		    <div><canvas width="300" height="150"></canvas></div>
		    <div><canvas width="300" height="150"></canvas></div>
		  </div>
		  <div class='container'>
		    <div class='list container vertical'>
		      <p class='description'>Area: <span class='output1'>0</span>K km<sup>2</sup></p>
		      <ul id='countries-on-left'>
		        <li>List Item</li>
		        <!-- lots of list times -->
		        <li>List Item</li>
		      </ul>
		    </div>
		    <div class='list container vertical'>
		      <p class='description'>Area: <span class='output2'>0</span>K km<sup>2</sup></p>
		      <ul id='countries-on-right'>
		        <li>List Item</li>
		        <!-- lots of list times -->
		        <li>List Item</li>
		      </ul>
		    </div>
		  </div>
		</div>

2. The minimal flex-based layout.

	{title="app.css"}
		/* Minimal flex grid */
		.container {
		  display: flex;
		}
		.container.vertical {
		  flex-direction: column;
		}
		.container > * {
		  flex: 1 1 auto;
		  border: 1px solid green; /* debug */
		}
		.container .shrink {
		  flex: 0 1 auto;
		}

3. For the flex to work perfectly, we give a width and height to the container, which is the HTML and body element in this case.

	{title="app.css"}
		/* Global */

		html, body {
		  width: 100%;
		  height: 100%;
		}
		#app {
		  width: 100%;
		  height: 100%;
		  background: IVORY;
		}

4. The flex layout will change the dimension on the children elements. We can specific a minimal width and height so the flex layout will keep a minimal space for the elements.

	{title="app.css"}
		/* Canvas */
		canvas {
		  max-width: 100%;
		  min-height: 150px;
		}

		.charts {
		  min-height: 150px;
		}

		/* Area Description */
		p.description {
		  min-height: 30px;
		}

5. Finally, we make the long list `overflow:scroll` and enable the momentum scrolling.

	{title="app.css"}
		/* List */
		ul {
		  overflow-x: hidden;
		  overflow-y: scroll;
		  -webkit-overflow-scrolling: touch;
		  list-style: none;
		  padding: 5px;
		}

We created a minimal flex based layout.

For every `.container` class, we display the children as flex items.

The children inside the container has `flex: 1 1 auto` by default.


	.container
	+----------------------------------------------------+
	| .container               .container                |
	| +----------------------+ +-----------------------+ |
	| |                      | |                       | |
	| |                      | |                       | |
	| |                      | |                       | |
	| |                      | |                       | |
	| |                      | |                       | |
	| +----------------------+ +-----------------------+ |
	|                                                    |
	+----------------------------------------------------+
	|                                                    |
	|                                                    |
	|                                                    |        .container {
	|                                                    |          display: flex;
	|                                                    |        }
	|                                                    |
	|                                                    |

	|                                                    |
	+----------------------------------------------------+


When the content exceeds the DOM container, we can use overflow scroll to make the content scroll inside the container. But this scroll wont have the momentum scrolling which common in the touch device. We need to add he  the webkit scrolling to enable the momentum scrolling.

## Step 2 – Listing the countries data

In this task, we obtain the list of countries areas and render them into the 2 lists we create in last step.

1. In last task, we created a long list to test the layout. Now we don’t need that list anymore because we are rendering the list dynamically. Replace the 2 `ul` elements into the following.

	{title="index.html"}
		<ul id='countries-on-left'>
		  <li class='template'><label><input type='radio' name='target-country'><span class='name'>China</span></label></li>
		</ul>
		...
		<ul id='countries-on-right'>
		  <li class='template'><label><input type='checkbox' name='countries[]'><span class='name'>China</span></label></li>
		</ul>

2. The country data is obtained from [Wikipedia](http://simple.wikipedia.org/wiki/List_of_countries_by_area). We put them into an array of object. For each object, we store the country name and the area.

	{title="data.coffee"}
		this.app ?= {}
		this.app.data ?= {}

		# Area of common countries
		# Source from http://simple.wikipedia.org/wiki/List_of_countries_by_area
		this.app.data.areaOfCountries = [
		  {name: 'China', area: 9651.747}
		  {name: 'Russia', area: 17098.242}
		  {name: 'Canada', area: 9889.000}
		  {name: 'USA', area: 9826.675}
		  {name: 'Australia', area:9596.691}
		  ...

3. We have the data now, the next step is to render the data into the HTML list.

	{title="view.coffee"}
		this.app ?= {}

		this.app.renderList = ->
		  # List
		  template = $('#countries-on-left').find('.template')
		  countriesOnLeft = $('#countries-on-left')
		  for country in app.data.areaOfCountries
		    clone = template.clone().removeClass('template')
		    clone.find('input[type="radio"]').val(country.area)
		    clone.find('.name').text(country.name)
		    countriesOnLeft.append clone
		  # Remove template after cloning done.
		  template.remove()

		  template = $('#countries-on-right').find('.template')
		  countriesOnLeft = $('#countries-on-right')
		  for country in app.data.areaOfCountries
		    clone = template.clone().removeClass('template')
		    clone.find('input[type="checkbox"]').val(country.area)
		    clone.find('.name').text(country.name)
		    countriesOnLeft.append clone
		  # Remove template after cloning done.
		  template.remove()

5. At last, we render the list in the `app.coffee`.

	{title="app.coffee"}
		this.app ?= {}

		this.app.renderList()

### What just happened?

Some JavaScript tutorial may show you to render HTML directly inside the JavaScript.

I prefer using the template approach where the template element of the radio list item and checkbox list item are defined inside the HTML. When I need it, I clone the template and update the data inside.

In this example, we use the template at the initial stage and we don’t need it after the setup logic, so we can remove the clone after the list creation. In some projects, we may need the template at unknown time after the project is setup. In this case, we can hide all the template elements by using `.template{display:none}`.

## Step 3 – Basic list selection and calculation

In this task, we handle the radio and checkboxes clicking and calculate the sum of area of selected countries.



### Time for Action

Let’s follow the steps to handle the radio and checkbox selection.

1. In the `view.coffee`, we add a function that check the input changes and display the calculation.

	{title="view.coffee"}
		this.app.handleListChange = ->
		  # Toggle Chart 1
		  $('input[type="radio"]').change ->
		    value = $('input[type="radio"]:checked').val()
		    $('.output1').text(Math.round(value))


		  # Toggle Chart 2
		  $('input[type="checkbox"]').change ->
		    sum = 0
		    $('input[type="checkbox"]:checked').each ->
		      sum += $(this).val()*1
		    $('.output2').text(Math.round(sum))

2. In the `app.coffee` file, we register the input changes handling by calling the function by the end of the logic.

	{title="app.coffee"}
		this.app.handleListChange()

### What just happened?

We handled the checkbox and radio selection.

The logic is based on the pseudo class `:checked` to get the HTML element of the checked input.

## Step 4 – Styling the radio and checkbox list

In this project, we customize the radio and checkbox styles.

### Time for Action

1. All the customization are done is CSS. Add the following style in the `app.css` file.

	{title="app.css"}
		/* Styling Radio and Checkbox */
		input[type='radio'],
		input[type='checkbox']{
		  display: none;
		}

		input[type='radio'] + .name,
		input[type='checkbox'] + .name{
		  display: block;
		  font-size: 1rem;
		  padding: 1rem .5rem;
		  padding-left: 2rem;
		  border: 1px solid transparent;
		  border-left: 0;
		  border-right: 0;
		  transition: all .3s ease-out;
		}

		input[type='radio']:checked + .name,
		input[type='checkbox']:checked + .name{
		  border-color:DARKORANGE ;
		}

		/* Radio specific */
		input[type='radio'] + .name {
		  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/15649/radio.svg) 10px 50% no-repeat;
		  background-size: 16px;
		}
		input[type='radio']:checked + .name {
		  background: SNOW url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/15649/radio-checked.svg) 10px 50% no-repeat;
		  background-size: 16px;
		}

		/* Checkbox specific */
		input[type='checkbox']:checked+.name {
		  background: SNOW url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/15649/checked.svg) 10px 50% no-repeat;
		  background-size: 16px;
		}

### What just happened?

We customize the radio and checkbooks by hiding the default browser rendered radio and checkbooks button. Then we use the label to customize the button graphic

The label works because clicking in the label is identical to clicking on the input. That means when we click on the label, we are toggling the real radio boxes and check boxes.

So we can define the :checked style in the css where we rely to customize our graphics

We used the SVG format for the checkbox and radio box graphics. We could use png. The reason we use SVG is because the vector format scale better on the retina display and look sharper than using png format.

## Step 5 – Drawing the chart

In this task, we draw the chart by using canvas.

### Time for Action

1. We add the `#chart1-canvas` and `#chart2-canvas` id to the canvas, so that our JavaScript logic can reference them.

	{title="index.html"}
		<div class='charts container'>
		  <div><canvas id="chart1-canvas" width="300" height="150"></canvas></div>
		  <div><canvas id="chart2-canvas" width="300" height="150"></canvas></div>
		</div>

2. The chart logic is encapsulated into the `chart.coffee` file.

	{title="chart.coffee"}
		this.app ?= {}

		# alias
		cjs = createjs

		class this.app.Chart
		  # Entry point.
		  constructor: (canvasId)->
		    @stage = new cjs.Stage(canvasId)

		    utility.retinalize @stage, false
		    @canvasWidth = utility.originalCanvasWidth

		  drawChart: (value) ->
		    @stage.removeAllChildren()
		    # each tile = 10K km2
		    areaForEachTile = 100
		    tileWidth = tileHeight = 10
		    margin = 5
		    numberOfTiles = value / areaForEachTile
		    cols = Math.floor((@canvasWidth-margin) / (tileWidth + margin))

		    for i in [0...numberOfTiles]
		      x = margin + Math.floor(i % cols) * (tileWidth + margin)
		      y = margin + Math.floor(i / cols) * (tileHeight + margin)
		      shape = new RectShape
		        fillColor: 'ORANGERED'
		        width: tileWidth
		        height: tileHeight
		        x: x
		        y: y
		      @stage.addChild shape

		    # Draw on canvas
		    @stage.update()

3. In the `handleListChange` function in view, we update the code to call the chart to draw the value.

	{title="view.coffee"}
		this.app.handleListChange = (chart1, chart2)->
		  # Toggle Chart 1
		  $('input[type="radio"]').change ->
		    value = $('input[type="radio"]:checked').val()
		    $('.output1').text(Math.round(value))
		    chart1.drawChart(value)

		  # Toggle Chart 2
		  $('input[type="checkbox"]').change ->
		    sum = 0
		    $('input[type="checkbox"]:checked').each ->
		      sum += $(this).val()*1
		    $('.output2').text(Math.round(sum))
		    chart2.drawChart(sum)

4. Finally, we create the chart instance and tell the view to draw the chart after any input changes.

	{title="app.coffee"}
		chart1 = new app.Chart("chart1-canvas")
		chart2 = new app.Chart("chart2-canvas")

		this.app.handleListChange(chart1, chart2)


	<----------------+  canvas\_width +------------------------------------>
	+--------------------------------------------------------------------+
	|                                                                    |
	|  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  |
	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
	|  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  |
	|       ^                                                            |
	|       |             ^ tile\_width                                   |
	|       |                                                            |
	|       +                                                            |
	|      margin                                                        |
	|                                                                    |
	|                                                                    |
	|                                                                    |
	|                                                                    |
	|                                                                    |
	|   tiles\_per\_row = (canvas\_width - margin) / (tile\_width + margin)  |
	|                                                                    |
	|                                                                    |
	|   x = index % tiles\_per\_row                                        |
	|                                                                    |
	|   y = Math.floor(index / tiles\_per\_row)                            |
	|                                                                    |
	|                                                                    |
	|                                                                    |
	|                                                                    |
	+--------------------------------------------------------------------+


## Step 6 – Adding the info panel and global app style

In the last step, we add an information page and fine tune the global styles.

The info panel is presented by CSS 3d that rotate in from the left screen.

### Time for Action

1. We add an `#info-btn` that trigger the info panel.

	{title="index.html"}
		<div id="info-btn">
		  <a href="#info"><span>Info</span></a>
		</div>

2. The `#info-panel` contains basic content.

	{title="index.html"}
		<div id='info-panel'>
		  <h1>Countries Area</h1>
		  <p>This tool let you compare the area of some countries.</p>
		  <p>Select countries on both list and compare them. Each tile in the chart is 100K km<sup>2</sup></p>
		  <p class='more-space'>Tap anywhere to begin.</p>
		  <p><small>Note: We only list several countries in this demo. <br>The source is from <a href="http://simple.wikipedia.org/wiki/List_of_countries_by_area">wikipedia</a>.</small></p>
		</div>

3. The `info-btn` sits on the top right corner.

	{title="app.css"}
		/* Info Button */
		#info-btn {
		  position: absolute;
		  top: 0;
		  right: 0;
		}
		#info-btn a{
		  width: 44px;
		  height: 44px;
		  display: block;
		  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/15649/info.svg);
		}
		#info-btn a span {
		  display: none;
		}

4. The `#info-panel` is full screen that rotate into the view in 3D.

	{title="app.css"}
		/* Info panel */
		.hidden {
		  transform: rotateY(-90deg);
		}
		.show {
		  transform: rotateY(0);
		}
		#info-panel {
		  position: absolute;
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		  background: ORANGERED;
		  color: white;

		  transform-origin: 0 0;
		  transition: all .3s ease-out;

		  display: flex;
		  flex-direction: column;
		  justify-content: center;
		  align-items: center;
		  text-align: center;
		}
		#info-panel a {
		  color: white;
		}
		#info-panel p {
		  margin: .5em;
		}
		p.more-space {
		  margin: 2em;
		}

5. For the rotate 3D effect, we add the `perspective` to body. We also fine tune the global style here.

	{title="app.css"}
		body {
		  perspective: 700px;
		  font-family: Verdana, sans-serif;
		  font-size: 12px;

		  padding: 5px;
		  background: ORANGERED;
		}

6. Finally, make sure we have removed the debugging style.

	{title="app.css"}
		.container > * {
		  border: 1px solid green; /* debug */
		}

### What just happened?

We have created a panel transition by using CSS 3D effects.

## Summary

We learnt a lot in the chapter. We created a simple app that let user select countries and display their area in a tile bar chart. In conclusion, after reading this chapter, you should be able to:

- Build app layout by using CSS flex box.
- Draw basic chart by using canvas and CreateJS library.

# Project 4B – Drawing charts on canvas

In this project, we modify previous chapter to draw different types of chart by using the canvas tag and CreateJS library. We will also animate the chart by using the TweenJS, which is part of the CreateJS suite.

## Mission Checklist

1. Animated bar chart
2. Animated tiles
3. Pie chart
4. Animated pie chart

## Preparation

In the `chart.coffee`, we have following alias declared for easier access to the CreateJS, TweenJS and the Ease library.

{title="chart.coffee"}
	# alias
	cjs = createjs
	Ease = cjs.Ease
	Tween = cjs.Tween

## Animated Bar Chart

There is not much difference in this project and previous project, in terms of app structure and logic flow. The main difference is in the `chart.coffee` where we draw different type of chart.

1. We prepare the structure of `Chart` class.

	{title="chart.coffee"}
		this.app ?= {}

		# alias
		cjs = createjs
		Ease = cjs.Ease

		class this.app.Chart
		  # Entry point.
		  constructor: (canvasId)->
		    @stage = new cjs.Stage(canvasId)
		    cjs.Ticker.setFPS(60);
		    cjs.Ticker.addEventListener 'tick', @stage

		    utility.retinalize @stage, false
		    @canvasWidth = utility.originalCanvasWidth
		    @canvasHeight = utility.originalCanvasHeight
		    @initChart()

		  initChart: ->
		    @stage.removeAllChildren()
		    # other init chart code later

		  drawChart: (value, refValue = 0) ->
		    # draw the chart code later

2. When we init the chart, we create the rectangle shape and referencing line. They are put into `this` (`@`) scope for the `drawChart` to access.

	{title="chart.coffee"}
		initChart: ->
		    @stage.removeAllChildren()
		    margin = 5

		    @shape = new RectShape
		      fillColor: 'ORANGERED'
		      width: @canvasWidth - margin
		      height: 1
		      x: margin
		      y: @canvasHeight
		    @stage.addChild @shape
		    @refLine = new RectShape
		      fillColor: 'RED'
		      width: @canvasWidth - margin
		      height: 1
		      x: margin
		      y: @canvasHeight
		    @stage.addChild @refLine

3. We have drew the shape in the `initChart` method. The `drawChart` method is actually used to calculate the chart dimension based on the provided value. At last, we animate the shape to the target position and dimension by using TweenJS.

	{title="chart.coffee"}
		drawChart: (value, refValue = 0) ->
		    areaForEachTile = 100
		    scaleY = value / areaForEachTile
		    y = @canvasHeight - scaleY
		    cjs.Tween.get(@shape).to({scaleY, y}, 400, Ease.quartOut)

		    refY = @canvasHeight - (refValue / areaForEachTile)
		    cjs.Tween.get(@refLine).to({y: refY}, 400, Ease.quartOut)

		    # Draw on canvas
		    @stage.update()

3. We changed the `drawChart` method arguments. Now we need the reference value for positioning the reference line. So we update the view logic where it toggles the `drawChart` method.

	{title="view.coffee"}
		this.app.handleListChange = (chart1, chart2)->
		  # Toggle Chart 1 and 2
		  $('input[type="radio"], input[type="checkbox"]').change ->
		    # Chart 1
		    value = $('input[type="radio"]:checked').val()
		    $('.output1').text(Math.round(value))
		    chart1.drawChart(value)
		    # Chart 2
		    sum = 0
		    $('input[type="checkbox"]:checked').each ->
		      sum += $(this).val()*1
		    $('.output2').text(Math.round(sum))
		    chart2.drawChart(sum, value)

### What just happened?

We used the TweenJS the first time. Here is the syntax:

{line-number="off"}
	craetejs.Tween.get(anyObject).to({property:newValue, …}, duration, easeFunction)

## Animated tiles chart

1. Similar to the last example, we prepare the `chart.coffee` file with the basic structure: `constructor`, `initChart` and `drawChart`.

	{title="chart.coffee"}
		class this.app.Chart
		  # Entry point.
		  constructor: (canvasId)->
		    @stage = new cjs.Stage(canvasId)

		    cjs.Ticker.setFPS(60)
		    cjs.Ticker.addEventListener 'tick', @stage

		    utility.retinalize @stage, false
		    @canvasWidth = utility.originalCanvasWidth
		    @canvasHeight = utility.originalCanvasHeight

		    @initChart()
		    @lastNumberOfTiles = 0


		  initChart: ->
		    @stage.removeAllChildren()
		    # Init code later


		  drawChart: (value) ->
		    # Code later

2. The `initChart` method will draw all the tiles in the canvas area. By default all the tiles has 0 scaling so they are not visible at the beginning.

	{title="chart.coffee"}
		initChart: ->
		  @stage.removeAllChildren()
		  tileWidth = tileHeight = 10
		  margin = 5
		  leadingMargin = margin + tileWidth / 2

		  chartArea = (@canvasWidth-margin-leadingMargin) * (@canvasHeight-margin-leadingMargin)
		  tileArea = (tileWidth + margin) * (tileHeight + margin)
		  @maxNumberOfTiles = Math.floor( chartArea / tileArea )
		  cols = Math.floor((@canvasWidth-margin) / (tileWidth + margin))

		  @shapes = []
		  for i in [0...@maxNumberOfTiles]
		    x = leadingMargin + Math.floor(i % cols) * (tileWidth + margin)
		    y = leadingMargin + Math.floor(i / cols) * (tileHeight + margin)
		    shape = new RectShape
		      fillColor: 'ORANGERED'
		      width: tileWidth
		      height: tileHeight
		      x: x
		      y: y
		    @stage.addChild shape
		    @shapes.push shape

		    shape.regX = tileWidth/2
		    shape.regY = tileHeight/2
		    shape.scaleX = shape.scaleY = 0

3. The `drawChart` method doesn’t draw the chart. It actually toggle the `scaleX` and `scaleY` of the existing tiles. It will scale up or down the tiles based on the given value.

	{title="chart.coffee"}
		drawChart: (value) ->
		  # each tile = 100K km2
		  areaForEachTile = 100
		  numberOfTiles = Math.floor(value / areaForEachTile)
		  for i in [0...@maxNumberOfTiles]
		    if i < numberOfTiles
		      delay = (i - @lastNumberOfTiles) * 5
		      Tween.get(@shapes[i]).wait(delay).to({scaleX:1, scaleY:1}, 400, Ease.quartOut)
		    else
		      delay = (i - @lastNumberOfTiles) * 2
		      Tween.get(@shapes[i]).wait(delay).to({scaleX:0, scaleY:0}, 400, Ease.quartOut)
		  @lastNumberOfTiles = numberOfTiles

4. In the `view.coffee`, we ensure the logic to toggle both chart is correct as the following. It is the same as the project 4 code.

	{title="view.coffee"}
		this.app.handleListChange = (chart1, chart2)->
		  # Toggle Chart 1
		  $('input[type="radio"]').change ->
		    value = $('input[type="radio"]:checked').val()
		    $('.output1').text(Math.round(value))
		    chart1.drawChart(value)

		  # Toggle Chart 2
		  $('input[type="checkbox"]').change ->
		    sum = 0
		    $('input[type="checkbox"]:checked').each ->
		      sum += $(this).val()*1
		    $('.output2').text(Math.round(sum))
		    chart2.drawChart(sum)

### What just happened?

We have created a nice animated tile-based bar chart.



## Static pie chart

1. There is only 1 pie chart. We change the HTML to contain 1 chart only.

	{title="index.html"}
		<div class='charts'>
		  <canvas id="chart-canvas" width="150" height="150"></canvas>
		</div>

2. We also center align the canvas.

	{title="app.css"}
		#chart-canvas {
		  display: block;
		  margin: auto;
		}

3. The pie chart is different from the bar chart we have created.

	{title="chart.coffee"}
		class this.app.Chart
		  # Entry point.
		  constructor: (canvasId)->
		    @stage = new cjs.Stage(canvasId)
		    cjs.Ticker.setFPS(60);
		    cjs.Ticker.addEventListener 'tick', @stage

		    utility.retinalize @stage, false
		    @canvasWidth = utility.originalCanvasWidth
		    @canvasHeight = utility.originalCanvasHeight
		    @initChart()
		  initChart: ->
		    @stage.removeAllChildren()

		  drawChart: (leftValue, rightValue) ->
		    x = @canvasWidth / 2
		    y = @canvasHeight / 2
		    r = 50

		    globalRotation = -90 * Math.PI / 180

		    percentage = rightValue / (leftValue + rightValue)
		    splitDegree = percentage * 360

		    #Arc 1
		    startAngle = 0 * Math.PI / 180 + globalRotation
		    endAngle = splitDegree * Math.PI / 180 + globalRotation
		    shape = new cjs.Shape()
		    shape.graphics
		      .beginFill "GOLD"
		      .moveTo(x, y)
		      .arc(x, y, r, startAngle, endAngle)
		      .lineTo(x, y)

		    @stage.addChild shape

		    # Arc 2
		    startAngle = splitDegree * Math.PI / 180 + globalRotation
		    endAngle = 360 * Math.PI / 180 + globalRotation

		    shape = new cjs.Shape()
		    shape.graphics
		      .beginFill "ORANGERED"
		      .moveTo(x, y)
		      .arc(x, y, r, startAngle, endAngle)
		      .lineTo(x, y)

		    @stage.addChild shape

4. We changed to 1 chart, so we also change the `handleListChange` method to toggle the chart with both values form left and right list.

	{title="view.coffee"}
		this.app.handleListChange = (chart)->
		  # Toggle Chart
		  $('input[type="radio"], input[type="checkbox"]').change ->
		    # Left
		    value = $('input[type="radio"]:checked').val()*1
		    $('.output1').text(Math.round(value))

		    # Right
		    sum = 0
		    $('input[type="checkbox"]:checked').each ->
		      sum += $(this).val()*1
		    $('.output2').text(Math.round(sum))

		    # Update Chart
		    chart.drawChart(value, sum)

## Animated pie chart

1. The animated chart.

	{title="chart.coffee"}
		class this.app.Chart
		  # Entry point.
		  constructor: (canvasId)->
		    @stage = new cjs.Stage(canvasId)
		    cjs.Ticker.setFPS(60);
		    cjs.Ticker.addEventListener 'tick', @stage

		    utility.retinalize @stage
		    @canvasWidth = utility.originalCanvasWidth
		    @canvasHeight = utility.originalCanvasHeight
		    @initChart()
		  initChart: ->
		    @pieData = {
		      splitDegree: 0
		    }

		  updateChart: (e) =>
		    # Code to draw arc shape later

		  drawChart: (leftValue, rightValue) ->
		    # Code to start the shape drawing later

2. In the `updateChart` method, we clear the stage and draw the arc again based on the current `splitDegree`.

	{title="chart.coffee"}
	    updateChart: (e) =>
	      x = @canvasWidth / 2
	      y = @canvasHeight / 2
	      r = 50
	      globalRotation = -90 * Math.PI / 180

	      @stage.removeAllChildren()

	      #Arc 1
	      startAngle = 0 * Math.PI / 180 + globalRotation
	      endAngle = @pieData.splitDegree * Math.PI / 180 + globalRotation
	      shape = new cjs.Shape()
	      shape.graphics
	        .beginFill "GOLD"
	        .moveTo(x, y)
	        .arc(x, y, r, startAngle, endAngle)
	        .lineTo(x, y)

	      @stage.addChild shape

	      # Arc 2
	      startAngle = @pieData.splitDegree * Math.PI / 180 + globalRotation
	      endAngle = 360 * Math.PI / 180 + globalRotation

	      shape = new cjs.Shape()
	      shape.graphics
	        .beginFill "ORANGERED"
	        .moveTo(x, y)
	        .arc(x, y, r, startAngle, endAngle)
	        .lineTo(x, y)

	      @stage.addChild shape

3. The `splitDegree` value is actually changing to create the animated effect.

	{title="chart.coffee"}
		drawChart: (leftValue, rightValue) ->
		      percentage = rightValue / (leftValue + rightValue)
		  splitDegree = percentage * 360

		  Tween.get(@pieData).to({splitDegree}, 400, Ease.quantOut).addEventListener('change', @updateChart)

### What just happened?

We used the TweenJS to animate the `pieData` object. TweenJS is an independent library that the target is not necessary to be any CreateJS display object. We can provide any object and ask the TweenJS to tween any numeric property. In the `change` event, we know the changes happened so we can updated our canvas in our own way. In this example, we create a new pie chart based on the changing value.

## Summary

Drawing chart is one of the common canvas usage.



## Further challenges

We have discussed the usage of gyroscope sensor in the chapter _Rain or Not_. What if combine what I have learned there with the chart drawing together? Try creating an inspector as following that shows the value history of the sensor.

![Rotation Inspector](images/rotation-inspector.png)

You can test the real application by using the following links with your devices.

- Gyroscope Rotation: `http://mztests.herokuapp.com/rotation/`
- Accelerometer: `http://mztests.herokuapp.com/motion`

Optionally, you may download the app in the Play Store.

{line-numbers=off}
	https://play.google.com/store/apps/details?id=net.makzan.gyroinspcetor&hl=en

The rotation value ranged from -365 to +365. When we use the following chart, the rotation value shows as a history for better inspection.

![Chart explanation](images/rotation-chart-explain.jpg)
