

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
