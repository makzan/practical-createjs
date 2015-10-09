{frontmatter}


# About author

Makzan focuses on web development and game design. He has over 14 years of experience in building digital products. He has worked on real-time multiplayer interaction games, iOS applications, and rich interactive websites.

He has written 4 books and 1 video course on building a Flash virtual world and creating games with HTML5 and the latest web standards. He is currently teaching courses in Hong Kong and Macao SAR. He writes tutorials and shares his thoughts on [makzan.net](http://makzan.net).

## Books by Makzan

Makzan has published 4 books and 1 video course.

- HTML5 games development by examples: A beginner’s guide, 2nd Edition
- HTML5 game development hotshot – Step by step game projects
- HTML5 game development video
- HTML5 games development by examples: A beginner’s guide
- Flash multiplayer virtual world

# Preface

This book focuses on building canvas-based application and games with the CreateJS suite. The gap between web application and native application is not as big as usual, thanks to the performance boost of the browser engine and the device processing power. By using web technologies in app development, we can benefit from the flexibility of web programming. Canvas and CreateJS allows us to go beyond static display. By combining the DOM elements and rich media rendering in canvas, we can provide immersive experience to our users.

Do keep in mind that we are never locked to any technology. Canvas based animation can works well together with the CSS animation and transition. We can also go for the hybrid approach by making use of the native navigation together with the high performance web view to render our content.

Hope you enjoy the book examples and go further by creating your rich interactive applications.




## Code Example

You can find the code example in the following GitHub repository.

{line-numbers=off}
	http://mak.la/cjs-examples

You can git clone the project to your machine so that you can update the code by using git commands. Alternatively, you may click “Download Zip” to download the whole bundle.

![Download source code](images/download-source-code.png)

# Thanks

Writing book is never easy. I would like to thank my family to support my writings.

Also, great thanks to the following friends who keep giving feedback a during the book writing process.

- Franklin Ng

{mainmatter}

# Preparation

In this part, we setup our environment and get ready for getting our hand dirty to code the example project.

# Pre-Request

This book assumes you have basic knowledge of client-side web development techniques. In order to follow the examples, you need to know basic HTML and CSS. You’ll learn some intermediate JavaScript programming skills too, but knowing some fundamental JS would be great.

A\> Searching online is helpful when you have questions on web issues. If you need reference on using the web standards, I recommend checking the [Mozilla Developer Network](https://developer.mozilla.org) for reference and [StackOverflow](http://stackoverflow.com) for questions and issues.

The following is a list of online resource that you may learn yourself alongside the book examples.

## HTML and CSS

Here is a list of resources if you need to get started learning HTML and CSS, the browser technology that display information and formatting styles.

- [HTML and CSS book](http://www.htmlandcssbook.com/) by [Jon Duckett](http://www.amazon.com/Jon-Duckett/e/B001IR3Q7I).

	This book helps you learn the most basic web design skills from scratch. The book demonstrates web design technologies with useful graphs and code examples.

- [Learn to Code HTML & CSS](http://learn.shayhowe.com/html-css/) by [Shay Howe](http://www.shayhowe.com/about/).

	Shay Howe shows the essential techniques to craft your own web page. It’s easy to follow and you’ll learn the fundamentals to get started as web designer.

- [Learn CSS Layout](http://learnlayout.com/) by [Bocoup](http://learnlayout.com/about.html).

	There are many ways to lay out content in CSS. This website provides comprehensive reference on all major layout approaches.

- [Learn to Code Advanced HTML & CSS](http://learn.shayhowe.com/advanced-html-css/) by [Shay Howe](http://www.shayhowe.com/about/).

	After you get familiar with basic HTML and CSS, you may read this resource that will take you to the next level of web design.

## JavaScript

We use a lot of JavaScript in this book. All the interaction and  canvas graphics are done via script. Here are several resources that worth reading.

- [JavaScript and jQuery 101](http://learn.jquery.com/javascript-101/) by [jQuery](http://learn.jquery.com).

	The jQuery learning center contains detail guides to learn the concept of JavaScript and jQuery. It’s a good place to reference different object types. It also teaches you the jQuery concept and essential code.

- [Eloquent JavaScript](http://eloquentjavascript.net) by [Marijn Haverbeke](https://marijnhaverbeke.nl).

	This is a must have book if you want to learn JavaScript inside out. It covers the JavaScript programming for both client-side and browser-side.

- [JavaScript book](http://www.javascriptbook.com) by [Jon Duckett](http://www.amazon.com/Jon-Duckett/e/B001IR3Q7I).

	Jon Duckett has the ability to present programming skills in an easy-to-follow way. This JavaScript book demonstrates how JavaScript and jQuery works in beautiful and useful illustrations and charts.

- [JavaScript Best Practices](http://www.thinkful.com/learn/javascript-best-practices-1/) by [Thinkful](http://www.thinkful.com).

	JavaScript can be evil if writing it badly. JavaScript Best Practices show different tricks to write maintainable and less buggy code.

- [JavaScript: The Right Way](http://jstherightway.org) by [William Oliveira](https://github.com/gnuwilliam).

	This is a big list of JavaScript resources containing latest  practices and modern libraries.

- [JavaScript: The Good Part](http://shop.oreilly.com/product/9780596517748.do) by [Douglas Crockford](https://plus.google.com/+DouglasCrockfordEsq/posts).

	This book shows the beauty part of JavaScript. It presents the readers how JavaScript is different than the traditional object-oriented programming languages. JavaScript has its own way to write OOP.

## CoffeeScript

CoffeeScript is beauty way to write JavaScript. It provides syntax that makes writing JavaScript application much easier. We will use CoffeeScript in some examples. Please note that CoffeeScript _is_ JavaScript. It is like shorthand of JavaScript. When we write our program, we still think in JavaScript way. So you still need to learn JavaScript well.

- [Official site of CoffeeScript](http://coffeescript.org/)

	The official site contains all the syntax that we need to get started.

- [JS2Coffee converter](http://js2coffee.org)

	At the beginning of learning CoffeeScript, you may find yourself struggling between JS and Coffee. This converter is a handy tool to convert the given script between JavaScript and CoffeeScript.

- [The little book of CoffeeScript](http://arcturo.github.io/library/coffeescript/)

	If you prefer reading book than website, you’ll find this book useful as the reference guide to the CoffeeScript syntax.

- [CoffeeScript Cookbook](http://coffeescriptcookbook.com)

	This cookbook contains lots of practical examples for your daily JS development needs.

- [CoffeeScript Ristretto](https://leanpub.com/coffeescript-ristretto/read)

	This book provides a journey of JavaScript and CoffeeScript development process. The examples in this book demonstrates how we can write code to get the job done at the first step, then fine tuning the code to make it more readable and maintainable.

# Tools we need in this book

We need the following tools to go through our projects.

## Operating system

Mac OS X is preferred to build iOS app. Otherwise, Linux and Windows works well as development machine.

## Required software

- Code editor

	Any text editor works. I recommend Sublime Text if you don’t have a preference.

- Modern web browsers

	Browsers are needed to test and debug our web app rendering.

- Android and iOS Simulator

	We need simulator to test how our web apps run in mobile operating system. We’ll use [Genymotion](http://www.genymotion.com) or official simulator for Android. We need Mac OS X and Xcode for the iOS simulator.

A\> Actually I always recommend testing our web apps in real devices. We can feel our own interface by holding it on hand. Is the button placement easy for tap? Is the font size suitable? How is the performance of the app running in aged devices? These are the questions that only real devices testing can answer.

## Optional

- Adobe Flash
	We will create some vector animations in Adobe Flash. CreateJS library integrates with the flash IDE so that we can export the timeline animation directly into the canvas. This is optional because the course code contains the exported animation we need. But if you want to change the animation, you may need Flash IDE to modify the source `.fla` file.

I\> ## What version of Adobe Flash supported?
I\> The exporting tool exists as a plugin in Adobe CS6. In CC 17.0, the tool appears as a command. In CC 17.1. The CreateJS toolkit is deeply integrated into the application.
I\> There are a new kind of `.fla` document called _Canvas Fla_. For any existing old fla project, we can simply convert the fla file to the new format by using the `Command > Convert a normal fla to canvas fla`.

A\> It’s always worth backing up the file before huge changes, such as format convertion.

- PhoneGap build service
	We need to pack the web pages and asset files into binary application in order to deploy it on app stores. PhoneGap is one of the solutions. The setup, however, may not be easy enough for web designer. PhoneGap Build provides a web service that lets us upload the client-side code and files. Then it builds the binary applications for different platforms without us handling the compilation environment.

A\> PhoneGap displays the web app inside a web view and use a native wrapper to build it as binary app. PhoneGap provides more than just a web view. It has many native API access exposed to the JavaScript scope.

## CoffeeScript compiling tools

When we write the logic in CoffeeScript, we need to compile them into JavaScript. You can choose your own method to compile the `.coffee` file into `.js`. Some compilers suggestion lists here in case you don’t have a favorite one yet.

- GruntJS
	GruntJS is a command line task runner for JavaScript. It allows developer to define how some inputs can be manipulated and transformed into the destination files.


- GulpJS
	GulpJS provides Grunt-similar task runner. The different is that GulpJS uses the concept of pipeline. That means we can write the tasks in cleaner way by ‘chaining’ the tasks.


- LiveReload
	LiveReload is a GUI tool that provides several handy features. It auto refreshes the browser when you save you files. It also compiles the preprocessor files for you, including CoffeeScript, SCSS and more.

- CodeKit
	CodeKit is another GUI tool with similar features from LiveReload. It is mac only and provides shortcut to install commonly-used libraries into your projects.



# Warming up

Before we go into the project, let’s do some warm ups to make ourselves familiar with the development workflow.


# Why CreateJS?

There are so many HTML5 game libraries out there. Why I choose CreateJS?

It is not a game engine. It is a library that takes graphics and animation drawing its main priority. Just like every one used Flash to make game, but still other creatives used Flash to build interactive applications. This is the same while using the CreateJS.

As a bonus, CreateJS integrates deeply in Adobe Flash. This allows us to create and export timeline-based animation to CreateJS’ canvas drawing JavaScript directly. That’s a very handy workflow if you use it probably.

## Quick demo – advertisement animation

Here is a quick demo to show how Adobe Flash exports an advertisement animation and plays in HTML5 with CreateJS. The following example is the classic tween animation directly exported from Flash. I didn’t edit the output code.

![Classic tween transition](images/whycreatejs-timeline.png)

How we make use of the generated code in our CreateJS project? We can instantiate the exported object add add it to the display list. The object name follows the name we set in the Flash IDE, either the linked class name or the library name. Then we can just add it to the CreateJS hierarchy by as using a normal Sprite object.


After we include the exported JavaScript file into our project, we can add the movieclip from the `.fla` library to the canvas display list by using the following code snippet. Here we assumed the clip name in Flash library is called `ExampleSprite`.

	var sprite = new ExampleSprite();
	this.stage.addChild(sprite);

![Canvas output of Flash ad](images/flash-ad.png)

A\> This example code adds the exported animation on the stage for demonstration purpose. In your project, you may want to add the animation to the display list hierarchy.

I have created a video demonstrating the process to make this advertisement and export the animation to CreateJS. You can find the video in the following link.

[http://mak.la/ad-demo](https://vimeo.com/109987674)

# Example projects

I like to learn via practical projects. That’s why I make this book full of example projects that you can follow and modify them to fit into your real world projects.

We will build the following projects.

- **Project 1**: Basic app with animated transitions
	In this project, we build a very basic canvas based app. The app demonstrates how we can create animated transition.

- **Project 1B**: DOM-based app with animated transitions

	In this project, we modify the project 1 to make all the content an HTML DOM element. This allows the content to be accessible and yet we keep the animation in Canvas.

- **Project 2**: Rain or Not?

	In this project, we separate the code into MVC model. That is dividing the code into Modal (Data), View and Controller modules. We also listen to the gyroscope in the mobile device to create a subtle motion parallax offset effect.

- **Project 3**: Our solar system

- **Project 4**: Drawing charts

# Project 1 – Basic app with animated transitions

In this project, we are going to build a designer portfolio. There is stylish navigation menu, animated transitions and static photos viewer.

![Screenshot of the app example](images/project-1-screenshot.png)

I have recorded a video of the app example that shows the animated transition. You may take a look to have a better understandings on what we are building.

[http://mak.la/cjs-demo1](https://vimeo.com/109947581)


## Mission Checklist

We are going to build the portfolio project by following these tasks.

1. Setting up the project and GulpJS.
2. Setting up the canvas and CreateJS library.
3. Defining scene as container inheritance.
4. Adding static stylish menu.
5. Displaying another scene after menu selection.
6. Animating transition between scenes.
7. Optimizing the rendering for retina display.

## Project Preparation

Throughout the project, we need several graphic files to complete the project. Please download the files via the following link.

{line-numbers=off}
	http://mak.la/cjs-proj1.zip

After you downloaded the file, you will see the following files in the bundle.

![PNG files for project 1](images/project-1-assets.png)

{line-numbers=off}
	images/
	images/header.png
	...
	scripts/transitions.js
	graphics_src/transitions.fla

The `transitions.js` file is the animated transition exported from the Adobe Flash. If you don’t have the Adobe Flash, you can just use this file who comes with 2 transitions to follow the example. If you have Flash, however, you can open the `transitions.fla` file and customize the transition animation. You may even create new transition effects. We will talk about this later.

## 1. Setting up the project and GulpJS

In this step, we prepare the compiling environment for our project.

### Preparation

Make sure we have _nodejs_ and _npm_ installed. `npm` is the package modules manager for nodejs. It’s included inside nodejs installer package.

### Time for Action—Setting up the project folder

In this steps, we will initial our project with the GulpJS compiling automation setup.

1. First, let’s create a folder for all the files in this project. The following is the initial file structure setup.

	{line-numbers=off}
	\<\<(code/code-1.1.1.txt)

2. We can generate the `package.json` file via the `npm init` method. After we go through the `npm init` process, we can then install the plugins via the following shell command.

	{line-numbers=off}
		$ npm install --save-dev gulp coffee-script gulp-coffee gulp-concat

3. After step 2, node.js should have written the following content into the `package.json` file. Check if you get similar result.

	{title="package.json"}
	\<\<(code/code-1.1.package.json)

4. Gulp always looks for the `Gulpfile.js` file when we execute the gulp tasks. If we want to write the Gulp tasks in CoffeeScript syntax, we need to load the CoffeeScript compiler in the `Gulpfile.js` and include the `.coffee` version of the GulpFile.

	{title="gulp.js"}
	\<\<(code/code-1.1.gulp.js)

5. Now we can write our Gulp pipeline in CoffeeScript. The following configuration defines how the compiler should compile our source files. It also defined a `watch` task that watch any changes of `.coffee` file and go through the `js` task automatically.

	{title="gulp.coffee"}
	\<\<(code/code-1.1.gulp.coffee)

6. We create 2 CoffeeScript files to see if our `Gulpfile` works. They are `app.coffee` and `setting.coffee`. We will add real code logic into these files in next step.

	{title="app.coffee"}
	\<\<(code/code-1.1.app.coffee)

	{title="setting.coffee"}
	\<\<(code/code-1.1.setting.coffee)

7. Now we can run `gulp` in the terminal:

		$ ./node_modules/.bin/gulp

8. We should see an `app.js` file is generated with the following content.

	{title="app.js"}
	\<\<(code/code-1.1.app.js)

If you get the same result, that means our setup works.

### What just happened?

We just set up the assets compiling tool chain. After setting up the building streamline, we are ready to dig into the early project development in next task.

### Init a Node.js project with package.json

The development environment uses Node.js, although the project is for web browser. We need to setup the project folder with an npm—Node.js Package Manager. We can execute `npm init` and following the steps to generate a `package.json` file in the project directory.

After created the `package.json` file, we called the `npm install`.

	$ npm install --save-dev gulp coffee-script gulp-coffee gulp-concat

The command installs the required package to compile our source code into JavaScript file. We used `--save-dev` which records the provided Node.js package as dependency libraries inside the `package.json`.

I\> If you’re working on a project with `package.json` file exists, you can use `npm install` to install node modules based on the existing `package.json` configuration. This happens when you clone a project from an external code repository.







## 2. Setting up the canvas and CreateJS library

In this step, we setup the canvas and the CreateJS for the project.

### Preparation

We need the CreateJS library. The easiest way to include the CreateJS is via the distribution of content delivery network.

{line-numbers=off}
	http://code.createjs.com/

Optionally, we can download the code from the CreateJS github repository and host the files ourselves.

{line-numbers=off}
	https://github.com/createjs


### Time for Action—Setting up the Canvas and CreateJS Stage

Let’s follow the following steps to setup our canvas and CreateJS library.

1. In the `index.html`, we prepare the basic HTML structure.

	{title="index.html"}
	\<\<(code/code-1.2.index.html)

2. We have minimal styling in this task because our focus is on the canvas element. Add the following CSS to the `styles/app.css` file.

	{title="styles/app.css"}
	\<\<(code/code-1.2.app.css)

3. We created a file named `setting.coffee` which holds our global app configuration variables. Add the following width and height setting to the file.

	{title="setting.coffee"}
	\<\<(code/code-1.2.setting.coffee)

4. Then we create the entry point of our app in the `app.coffee`. Add the following code to the file.

	{title="app.coffee"}
	\<\<(code/code-1.2.app.coffee)

5. We have created the app’s foundation. Although we don’t see any content yet, the app foundation is ready and we can add our scene to the app in next step.

### What just happened?

We just created the basic canvas app and CreateJS setup. In next step, we’ll build our scene. Let’s take a look at each part of code in this step.

#### Viewport

{line-numbers=off}
	<meta name="viewport" content="width=device-width, initial-scale=1">

We target the app to be a mobile application. So we need to set a viewport. Mobile web browser simulate the device width as a desktop monitor to provide a better viewing experience for most desktop-only website. Viewport lets web designer tells the mobile browser the display configurations we want.

The default viewport of mobile web browser is about 980px. If we have created the styles dedicated to narrow screen, such as 320px width, we should change the viewport width to reflect the real device width.

I\> If you want to provide an app like experience where users cannot zoom the view, you may consider adding the `minimum-scale` and `maximum-scale` value to the viewport. In contrasts, adding these two constants to web site will harm the user experience because website readers expect they can pinch to zoom any web pages.

#### Web app capable

{line-numbers=off}
	<meta name="apple-mobile-web-app-capable" content="yes">

We want to provide an app experience to the user. When user add the web app into home screen, normal web pages act as bookmark. Tapping on them launch the mobile safari. After we set the `apple-mobile-web-app-capable`, the home screen bookmark acts like a real app. It has its own we view without the Safari user interface. It also has its own app switching screen in the multitask screen when user clicked the home button twice.



#### Default value when variable is undefined

{line-numbers=off}
	this.exampleApp ?= {}

The equivalent way in JavaScript is:

{line-numbers=off}
	if (this.exampleApp == null) this.exampleApp = {}

We can also express the same meaning with the following line, which looks cleaner.

{line-numbers=off}
	this.exampleApp = this.exampleApp || {}

#### Centering the canvas

I\> I will update this section to use Flexbox for center alignment.

The canvas has fixed dimension. We can use the following styles to center aligning the canvas at the middle of the page.

	#app > canvas {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  height: 400px;
	  width: 300px;
	  margin-top: -200px;
	  margin-left: -150px;
	}

The code is inspired from the following CSS-Tricks website which shares different styling approaches to center elements.

{line-numbers=off}
	http://css-tricks.com/centering-css-complete-guide/

### Class definition in CoffeeScript

The `class` in CoffeeScript allows us to define a class definition and then we can create instance via the `new` method.

	class App
	  # Entry point.
	  constructor: ->

	# Start the app
	new App()



Let’s take a look at the JavaScript from the CoffeeScript generator.

	var App;

	App = (function() {
	  function App() {}

	  return App;

	})();

	new App();




## 3. Defining scene as container inheritance
In this step, we define the Scene class which every page view builds on top of it.

### Time for Action—Defining the Scene class
Let’s follow the steps to define a `Scene` class.

1. We create a dedicated file for the scenes definition. Add the following code to the `scenes.coffee`.

	{title="scenes.coffee"}
		# a global app object.
		this.exampleApp ?= {}

		# alias
		cjs = createjs
		setting = this.exampleApp.setting

		class Scene extends cjs.Container
		  constructor: (bgColor='blue')->
		    # CreateJS super constructor
		    @initialize()

		    # Draw a shape as the background color
		    if bgColor != undefined
		      shape = new cjs.Shape()
		      shape.graphics
		        .beginFill bgColor
		        .drawRect 0, 0, setting.width, setting.height

		      # Add the shape to the display list, via using addChild
		      @addChild shape

		# export to global app scope
		this.exampleApp.Scene = Scene

2. In the `app.coffee`, we create the Scene instance and add it to the stage. This is a testing scene, we are going to change it to the real scene in next step.
	{title="app.coffee"}
		Scene = this.exampleApp.Scene

		class App
		  constructor: ->
		    ...
		    leanpub-start-insert
		    # Temporary testing scene
		    testScene = new Scene('gold')
		    @stage.addChild testScene
		    leanpub-end-insert

3. We have created a new file `scenes.coffee`, we need to include it into the GulpJS pipeline. Add the file into the `gulp.src` array.

	{title="Gulpfile.coffee"}
		gulp.task 'js', ->
		  gulp.src [
		    './app/scripts/setting.coffee'
		    leanpub-start-insert
		    './app/scripts/scenes.coffee'
		    leanpub-end-insert
		    './app/scripts/app.coffee'
		  ]
		  .pipe coffee()
		  .pipe concat 'app.js'
		  .pipe gulp.dest './app/scripts/'

### What just happened?

We have defined a `Scene` class and added a testing scene object to the stage.

#### Vector shape drawing

A shape is vector graphic that we express in mathematics. It’s like giving instruction on what the shape should look like.

	shape = new cjs.Shape()
	shape.graphics
	  .beginFill "white"
	  .drawRect 0, 0, 100, 50

A\> If you need to draw complex shapes that are difficult to express in code, you may consider drawing the shapes in Adobe Flash and export it to JavaScript to use.

For every created display object, we need to add it to the display list. The following code assumes that we are adding the shape to a container.

{line-numbers=off}
	@addChild shape

If we are adding the shape to the stage, we can call the `stage.addChild` because the `stage` is a container.

### Class inheritance in CoffeeScript

The CoffeeScript inheritance took us 3 lines to inherit class.

	class Scene extends cjs.Container
	  constructor: (bgColor='blue')->
	    @initialize()

In the generated code. It would take 13 lines of code in JavaScript, not including the `_extends` helper function.

	var Scene,
	  __hasProp = {}.hasOwnProperty,
	  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

	Scene = (function(_super) {
	  __extends(Scene, _super);

	  function Scene(bgColor) {
	    if (bgColor == null) {
	      bgColor = 'blue';
	    }
	    this.initialize();
	  }

	  return Scene;

	})(cjs.Container);



Actually, all the CreateJS follows its own way to create the object inheritance structure. The following source code of the `Shape` class shows  how CreateJS inherits.

{title="Shape.js, from CreateJS"}
	(function() {
	  "use strict";

	  var Shape = function(graphics) {
	    this.initialize(graphics);
	  };
	  var p = Shape.prototype = new createjs.DisplayObject();
	  Shape.prototype.constructor = Shape;

	  // public properties:

	    p.graphics = null;

	  // constructor:

	    p.DisplayObject_initialize = p.initialize;

	    p.initialize = function(graphics) {
	      this.DisplayObject_initialize();
	      this.graphics = graphics ? graphics : new createjs.Graphics();
	    };


	    p.isVisible = function() {
	      ...
	    };


	    p.DisplayObject_draw = p.draw;


	    p.draw = function(ctx, ignoreCache) {
	      ...
	    };


	    p.clone = function(recursive) {
	      ...
	    };

	    p.toString = function() {
	      ...
	    };

	  createjs.Shape = Shape;
	}());

### Exporting the class definition

We separate each part of code into its own file. The benefit of having separated files is that we can modularity logic into very specific domain. For every specific module, we only focus on its own logic. This helps making each parts less bugs.

It is a good practice that each file is separated. The compiled JavaScript of each files are put into an isolated function group by default. If we need to expose specific variables to other files, we can reference them to the global object under the app namespace.

{line-numbers=off}
	this.exampleApp.Scene = Scene

Then we can reference the exported Class in another file.

{line-numbers=off}
	Scene = this.exampleApp.Scene



## 4. Adding static stylish menu

In this step, we implement the menu scene and put menu item on it.



### Time for Action

Let’s follow the steps to create the menu scene.

1. We create the our menu scene. Let’s add the code to `scenes.coffee`.

	{title="scenes.coffee"}
		class SceneA extends Scene
		  constructor: ->
		    super('#EDE4D1')

		    header = new cjs.Bitmap 'images/header.png'
		    header.scaleX = header.scaleY = 0.5
		    @addChild header

		    info = new cjs.Bitmap 'images/info.png'
		    info.y = 356
		    info.scaleX = info.scaleY = 0.5
		    @addChild info

		    photoA = new cjs.Bitmap 'images/a.png'
		    photoA.y = 38
		    photoA.scaleX = photoA.scaleY = 0.5
		    @addChild photoA

		    photoB = new cjs.Bitmap 'images/b.png'
		    photoB.y = 146
		    photoB.scaleX = photoB.scaleY = 0.5
		    @addChild photoB

		    photoC = new cjs.Bitmap 'images/c.png'
		    photoC.y = 253
		    photoC.scaleX = photoC.scaleY = 0.5
		    @addChild photoC

		# export to global app scope
		this.exampleApp.SceneA = SceneA


2. Make sure we import any newly created class into our App scope in order to use them.

	{title="app.coffee"}
		# alias
		cjs = createjs
		setting = this.exampleApp.setting
		leanpub-start-delete
		Scene = this.exampleApp.Scene
		leanpub-end-delete
		leanpub-start-insert
		SceneA = this.exampleApp.SceneA
		leanpub-end-insert


3. In the app logic, we replace the old `Scene` by the newly created `SceneA` class.

	{title="app.coffee"}
		class App
		  constructor: ->
		    ...
		    sceneA = new SceneA()
		    @stage.addChild sceneA

### What just happened?

We created a new scene by inheriting the original `Scene` class definition. The inheritance allows us to define custom scene easily.

## 5. Displaying another scene after menu selection

In this step, we build a simple scene manager to control the presence of different scenes.

### Preparation

Our scene management is inspired from the navigation controller in iOS. The navigation controller stores a stack of added scene. Developers that use this manager can push and pop scenes.

### Time for Action

Let’s follow the steps to create our own scene manager for the app.

1. We have more than 1 scene in our app. To make things easier, we design a scene manager that manage the scene displaying and leaving. we create a new file named `scene-management.coffee` for this logic. Then put the following code into the newly created file.

	{title="scene-management.coffee"}
		# a global app object.
		this.exampleApp ?= {}

		# An object to manage scene, under the app namespace.
		this.exampleApp.sceneManager = {
		  stage: undefined
		  scenes: []
		  lastScene: -> @scenes[@scenes.length-1]
		  resetWithScene: (scene) ->
		    @scenes.length = 0
		    @scenes.push scene
		    @stage.addChild scene
		  popScene: ->
		    @stage.removeChild @lastScene()
		    @scenes.pop()
		    @lastScene().mouseEnabled = true
		  pushScene: (scene)->
		    @lastScene().mouseEnabled = false
		    @scenes.push scene
		    @stage.addChild scene
		}

2. We create more scenes to test our example. Add the `SceneB` to the `scenes.coffee`.

	{title="scenes.coffee"}
		class SceneB extends Scene
		  constructor: (contentId='a')->
		    super('white')

		    content = new cjs.Bitmap "images/page-view-content-#{contentId}.png"
		    content.scaleX = content.scaleY = 0.5
		    @addChild content

		    header = new cjs.Bitmap 'images/header-back.png'
		    header.scaleX = header.scaleY = 0.5
		    @addChild header

		    header.on 'click', ->
		      sceneManager.popScene()

3. Then we create the `SceneInfo`.

	{title="scenes.coffee"}
		class SceneInfo extends Scene
		  constructor: ->
		    super('white')

		    content = new cjs.Bitmap "images/info-content.png"
		    content.scaleX = content.scaleY = 0.5
		    @addChild content

		    @on 'click', ->
		      sceneManager.popScene()

4. Make sure we export the newly defined class so that the `App`, which is in another file, can access to these classes.

	{title="app.coffee"}
		# export to global app scope
		this.exampleApp.SceneA = SceneA
		this.exampleApp.SceneB = SceneB
		this.exampleApp.SceneInfo = SceneInfo


5. In the `scenes.coffee` file, we add the click event handling to the menu elements. Tapping the elements will lead to a new scene to display the image or the information scene.

	{title="scenes.coffee"}
		sceneManager = this.exampleApp.sceneManager

		info = new cjs.Bitmap 'images/info.png'
		info.y = 356
		info.scaleX = info.scaleY = 0.5
		@addChild info
		leanpub-start-insert
		info.on 'click', ->
		  scene = new SceneInfo()
		  sceneManager.pushScene scene
		leanpub-end-insert

		# Menu item 1
		photoA = new cjs.Bitmap 'images/a.png'
		photoA.y = 38
		photoA.scaleX = photoA.scaleY = 0.5
		@addChild photoA
		leanpub-start-insert
		photoA.on 'click', ->
		  scene = new SceneB('a')
		  sceneManager.pushScene scene
		leanpub-end-insert

		# Menu item 2
		photoB = new cjs.Bitmap 'images/b.png'
		photoB.y = 146
		photoB.scaleX = photoB.scaleY = 0.5
		@addChild photoB
		leanpub-start-insert
		photoB.on 'click', ->
		  scene = new SceneB('b')
		  sceneManager.pushScene scene
		leanpub-end-insert

		# Menu item 3
		photoC = new cjs.Bitmap 'images/c.png'
		photoC.y = 253
		photoC.scaleX = photoC.scaleY = 0.5
		@addChild photoC
		leanpub-start-insert
		photoC.on 'click', ->
		  scene = new SceneB('c')
		  sceneManager.pushScene scene
		leanpub-end-insert

6. We have created a few new scenes. Make sure we have aliased these new classes in the `app.coffee` file.

	{title="app.coffee"}
		# alias
		cjs = createjs
		setting = this.exampleApp.setting
		leanpub-start-insert
		sceneManager = this.exampleApp.sceneManager
		leanpub-end-insert
		SceneA = this.exampleApp.SceneA
		leanpub-start-insert
		SceneB = this.exampleApp.SceneB
		SceneInfo = this.exampleApp.SceneInfo
		leanpub-end-insert

7. In the main `App` logic, We removed the old Scene creation logic and make use of the `sceneManager` to handle the scene visualization.

	{title="app.coffee"}
		class App
		  constructor: ->
		    ...

		    leanpub-start-delete
		    sceneA = new SceneA()
		    @stage.addChild sceneA
		    leanpub-end-delete

		    sceneManager.stage = @stage

		    scene = new SceneA()
		    sceneManager.resetWithScene scene

8. We created new files so we need to include the files in the Gulpfile compiling pipeline.

	{title="Gulpfile.coffee"}
		gulp.task 'js', ->
		  gulp.src [
		    './app/scripts/setting.coffee'
		    leanpub-start-insert
		    './app/scripts/scene-manager.coffee'
		    leanpub-end-insert
		    './app/scripts/scenes.coffee'
		    './app/scripts/app.coffee'
		  ]
		  .pipe coffee()
		  .pipe concat 'app.js'
		  .pipe gulp.dest './app/scripts/'

### What just happened?

The scene manager is an object without class definition. We put it on the `exampleApp` namespace to let other modules access it.

There are 2 properties, `stage` and `scenes`. The `stage` is refer to the target container that holds the scenes. The `scenes` is an array of the scenes we have added to the stage.

Then we defined 3 essential methods, `resetScene`, `pushScene` and `popScene`, and 1 helper method, `lastScene`.

The `resetWithScene` clears the scenes array to provide a clean state. Then it add the give scene as the first scene, as known as root scene in such kind of navigation pattern.

The `pushScene` takes the given new scene object and add to the scenes stack. Then it displays the new added scene to the screen.

The `popScene`, on the other hand, remove the last scene from the screen and from the scenes stack. That’s why we have a helper method that returns the last scene.


## 6. Animating transition between scenes

In this step, we make use of the exported Flash animation to build the animated transition effect.

### Preparation

Before we begin, make sure we have the `transitions.js` file ready in the `scripts` folder. We include the file into the `index.html` before loading our main App logic.

{title="index.html"}
	...
	  <script src="http://code.createjs.com/easeljs-0.7.1.min.js"></script>
	  <script src="http://code.createjs.com/tweenjs-0.5.1.min.js"></script>
	  <script src="http://code.createjs.com/movieclip-0.7.1.min.js"></script>
	  leanpub-start-insert
	  <script src="scripts/transitions.js"></script>
	  leanpub-end-insert
	  <script src="scripts/app.js"></script>
	</body>

I\> If you have modified the animation in Flash, you need to publish the Flash document again to update the JavaScript file.

### Time for Action

Let’s work on the following steps to add the animated transition to the app.

1. In the `scene-manager.coffee`, we add one new method `pushSceneWithTransition` which add the animated transition while switching scenes.

	{title="scene-manager.coffee"}
		this.exampleApp.sceneManager = {
		  ...
		  pushSceneWithTransition: (scene, transitionClassName) ->
		    transition = new lib[transitionClassName]()
		    transition.x = setting.width/2
		    transition.y = setting.height/2

		    scene.visible = false

		    @pushScene scene

		    # The transition animation in Flash should dispatch `sceneShouldChange` event.
		    transition.on 'sceneShouldChange', ->
		      scene.visible = true

		    @stage.addChild transition
		}

2. In the `scenes.coffee`, we change to use the new `pushSceneWithTransition` method.

	{title="scenes.coffee"}
		class SceneA extends Scene
		  constructor: ->

		...
		info.on 'click', ->
		  scene = new SceneInfo()
		  leanpub-start-insert
		  sceneManager.pushSceneWithTransition scene, 'TransitionAnimationA'
		  leanpub-end-insert

		...
		photoA.on 'click', ->
		  scene = new SceneB('a')
		  leanpub-start-insert
		  sceneManager.pushSceneWithTransition scene, 'TransitionAnimationB'
		  leanpub-end-insert

		...
		photoB.on 'click', ->
		  scene = new SceneB('b')
		  leanpub-start-insert
		  sceneManager.pushSceneWithTransition scene, 'TransitionAnimationB'
		  leanpub-end-insert

		...
		photoC.on 'click', ->
		  scene = new SceneB('c')
		  leanpub-start-insert
		  sceneManager.pushSceneWithTransition scene, 'TransitionAnimationB'
		  leanpub-end-insert


### What just happened?

We have added a custom animated transition when we switch scene in the app.

#### Adding the generated transition

Any exported Flash movieclip is put into a `lib` namespace. For example, if the movieclip name is `AnimatedBall`, we can create an instance by using `new lib.AnimatedBall()`.

In our code, the transition class name is a variable. By using the array notation instead of dot notation, we can create new instance of a class where the class name is variable.

{line-numbers=off}
	new lib[transitionClassName]()

#### Custom event: sceneShouldChange

In the scene manager, we listen to the `sceneShouldChange` event and toggle the new scene’s visibility.

	transition.on 'sceneShouldChange', ->
	  scene.visible = true

This relies on the Flash animation which dispatches the event at the middle of the transition animation.

![sceneShouldChange event in the Flash timeline](images/project-1-scene-should-change.png)

In the screenshot, you will find an action is defined in the middle of the transition animation. When the animation reaches this frame, it dispatch the event. We capture this custom event in the scene manager to actually switch the scene.


## 7. Optimizing for retina display

We may find the app looks blurry when we test the web app in iPhone or Android device with high-definition display. That’s because the retina display trys to render the graphics by doubling our pixels. In this step, we optimize the canvas rendering in retina display.

### Time for Action

Let’s add the `retinalize` utility via the following steps.

1. The `retinalize` method is kind of utility that’s independent to our logic. We create a new file `utility.coffee` and place the following code inside it.

	{title="utility.coffee", lang=coffeescript}
		retinalize = (canvas, stage) ->
		  # We skip the logic if the device is not retina
		  # or it doesn’t support the pixel ratio
		  return if (window.devicePixelRatio)

		  # cache the pixel ratio
		  ratio = window.devicePixelRatio
		  # get the original canvas dimension
		  height = canvas.getAttribute('height')
		  width = canvas.getAttribute('width')

		  # set the new dimension with ratio multiplication
		  canvas.setAttribute('width', Math.round(width * ratio))
		  canvas.setAttribute('height', Math.round( height * ratio))

		  # ensure the canvas CSS style follows the original dimension
		  canvas.style.width = width+"px"
		  canvas.style.height = height+"px"

		  # scale the entire stage so we can use the original coordinate in our app.
		  stage.scaleX = stage.scaleY = ratio

2. We can then call the retinalize method after we initialize the canvas and stage variable.

	{title="app.coffee"}
	    class App
		  # Entry point.
		  constructor: ->
		    console.log "Welcome to my portfolio."
		    @canvas = document.getElementById("app-canvas")
		    @stage = new cjs.Stage(@canvas)

		    window.utility.retinalize(@canvas, @stage)

3. We have created a new file. As usual, we include the new file in our compiling pipeline. Add the following highlighted line to the `Gulpfile.coffee`.

	{title="Gulpfile.coffee"}
		gulp.task 'js', ->
		  gulp.src [
		    './app/scripts/setting.coffee'
		    leanpub-start-insert
		    './app/scripts/retinalize.coffee'
		    leanpub-end-insert
		    './app/scripts/scene-manager.coffee'
		    './app/scripts/scenes.coffee'
		    './app/scripts/app.coffee'
		  ]
		  .pipe coffee()
		  .pipe concat 'app.js'
		  .pipe gulp.dest './app/scripts/'

### What just happened?

When the browser detects the display has a higher devicePixelRatio, which means for every ‘point’ of the display, it renders more than 1 pixels. For such types of display, we enlarge the canvas content while keeping the dimension of the  `<canvas>` element unchanged. This allows the retina display to render the graphics in its native pixel resolution, and hence make the canvas graphics looks sharp.

I\> It’s worth noting that the retina display not only applies to mobile device but also desktops, such as Mackbook Pro Retina and the 5K retina iMac.



## Further challenges

There are some essential features we haven’t implemented in the example app.

For example, we don’t have scrolling in the menu scene so we can’t display more photos.




# Project 1B – DOM-based app with animated transitions

In this project, we improve the *Project 1* to make all the content accessible by the browsers.


## Mission Checklist

We are going to replace the canvas-based content into DOM elements.

1. Defining DOM elements
2. Controlling page-based scenes.
3. Positioning the canvas-based transition to fit window size.
4. Falling back for old browser without canvas support.
5. Fine tuning the app styles.
6. Supporting retina display.

## Project Preparation

In the project, we will need the updated image assets. You may download them via the following URL.

http://mak.la/cjs-proj1b-images.zip

## 1. Defining DOM elements


### Time for Action

1. In our `index.html` we had the canvas inside the `#app` DIV. We will add new DOM elements after this canvas tag, for each page of content.

	{title="index.html"}
		<div id="app">
		  <canvas id="app-canvas" width="300" height="400"></canvas>
		  <!-- We will add each page of content from here -->
		</div>

2. First, we add the main menu page. Add the following `#main` DIV after our canvas.

	{title="index.html"}
		<div id="app">
		  <canvas id="app-canvas" width="300" height="400"></canvas>
		  leanpub-start-insert
		  <div id="main" class="page">
		    <div class='header'>
		      <img src="images/header.png" alt="Header">
		    </div>
		    <ul id="main-list" class='non-collapse-content'>
		      <li><a href="#detail-page"><img src='images/a.png' alt='Photo A'></a></li>
		      <li><a href="#detail-page"><img src='images/b.png' alt='Photo B'></a></li>
		      <li><a href="#detail-page"><img src='images/c.png' alt='Photo C'></a></li>
		      <!-- Feel free to add more list items here -->
		    </ul>
		    <div id="info-link">
		      <a href="#info-page" data-transition="TransitionAnimationA"><img src='images/info.png' alt='Link to Info'></a>
		    </div>
		  </div>
		  leanpub-end-insert
		</div>

3. Next, we add the `#detail-page` after the mail page. You may add other page if needed.

	{title="index.html"}
		<div id="app">
		  <canvas id="app-canvas" width="300" height="400"></canvas>
		  <div id="main" class="page">...</div>
		  leanpub-start-insert
		  <div id="detail-page" class="page">
		    <a href="#" class='header'><img src='images/header-back.png' alt='Back to main'></a>
		    <img src='images/photo-a.png' alt='Detail of Photo A'>
		    <p>Here is a photo from Unsplash. The photo is free for commercial use. I put it here just for the app example. The photo was taken by Ben Moore.</p>
		    <div id="info-link">
		      <a href="#info-page" data-transition="TransitionAnimationA"><img src='images/info.png' alt='Link to Info'></a>
		    </div>
		  </div>
		  leanpub-end-insert
		</div>

4. Finally, we add the `#info-page`. Please note that we have replaced the text image into real text.

	{title="index.html"}
		<div id="app">
		  <canvas id="app-canvas" width="300" height="400"></canvas>
		  <div id="main" class="page">...</div>
		  <div id="detail-page" class="page">...</div>
		  leanpub-start-insert
		  <div id="info-page" class="page">
		    <a href="#" class='header'><img src='images/header-back.png' alt='Back to main'></a>
		    <div class='non-collapse-content'>
		      <p>This is an example app that serves as the 1st chapter of my book – Rich Interactive App Development with CreateJS. This example demonstrates a custom animated transition. It lacks some essential features but this is just for the chapter 1. More features coming in future chapter.</p>
		      <p>This example is bought to you by Makzan. He has written three books and one video course on building a Flash virtual world and creating games with HTML5 and the latest web standards. He is currently teaching courses in Hong Kong and Macao SAR.</p>
		    </div>
		  </div>
		  leanpub-end-insert
		</div>

5. Before we move on, we add some basic styles. It replaces the CSS file from _project 1_.

	{title="app.css"}
		ul {
		  list-style: none;
		}

		img {
		  width: 100%;
		  border: 0;
		}

		/* canvases sit inside the #app frame. It’s similar to layers. */
		#app {
		  position: relative;
		}
		#app > canvas {
		  position: fixed;
		  display: none; /* default hide until we use it */
		  z-index: 999;
		}

### What just happened?

We are building the project of Jack Portfolio from scratch. We use DIV with `.page` class to indicate one page of content. They are all added into `#app` element.

Here is the new `#app` DOM structure.

	<div id="app">
	  <canvas id="app-canvas" width="300" height="400"></canvas>
	  <div id="main" class="page">...</div>
	  <div id="detail-page" class="page">...</div>
	  <div id="info-page" class="page">...</div>
	</div>

The HTML is designed to be used without any JavaScript and fancy transition effect. All the links between content are based on the hash anchors. User can still view and link to different part of the content with neither canvas support nor JavaScript support.


## 2. Page Transition Manager

In this step, we control our `.page` DOM elements by a `PageManager`.

### Preparation

We need to modify the scenes management. It was controlling the `DisplayObject` in CreateJS canvas. Now we need to control the DOM elements. I changed the class from `SceneManager` to `PageManager` to make the code less confusing. The structure will be the same as what we had in canvas-based scenes manager.

	class app.PageManager
	  constructor: (@stage)->
	    # init the pages
	  lastScene: ->
	    # return last scene
	  resetWithScene: (scene) ->
	    # reset scene
	  popScene: ->
	    # remove the last scene
	  pushScene: (scene)->
	    # show the given scene
	  pushSceneWithTransition: (scene, transitionClassName) ->
	    # show the given scene with transition




### Time for Action

1. First, we work on the CSS. Each page is absolute positioned

	{title="app.css"}
		/* canvases sit inside the #app frame. It’s similar to layers. */
		#app {
		  position: relative;
		}
		#app > canvas {
		  position: fixed;
		  display: none; /* default hide until we use it */
		  z-index: 999;
		}

		/* Page related */
		.page {
		  width: 100%;
		  height: 100%;
		  position: absolute;
		}

2. By default, we hide all the `.page`. The first page will be added from the `resetWithScene` method.

	{title="page-manager.coffee"}
		constructor: (@stage)->
		    @scenes = []
		    $('.page').hide()

		    # register clicks on all pages
		    $('a[href^="#"]').click (event) =>
		      pageId = $(event.currentTarget).attr('href')

		      # when it's link to #, it is a back transition
		      pageId = '.page:first' if pageId == '#'

		      transition = $(event.currentTarget).data('transition')

		      @pushSceneWithTransition $(pageId), transition

3. The `lastScene` returns the last element of the `scenes` array.

	{title="page-manager.coffee"}
		lastScene: -> @scenes[@scenes.length-1]

4. In the `resetScene` method, we reset the scenes array and use jQuery to show the given scene.

	{title="page-manager.coffee"}
		resetWithScene: (scene) ->
		  @scenes.length = 0
		  @scenes.push scene

		  $(scene).show()

5. When we remove scene, we don’t actually remove the scene like we did in canvas. Instead, we hide the DOM element of the scene.

	{title="page-manager.coffee"}
		popScene: ->
		  $(scene).hide()
		  @scenes.pop()

6. In DOM elements, we control the DOM’s visibility. So pushing a scene means we hide the last one and show the given one. The browser may be scrolled in the last scene, that’s why we reset the scroll position.

	{title="page-manager.coffee"}
		pushScene: (scene)->
		    $(@lastScene()).hide()
		    @scenes.push scene
		    $(scene).show()

		    # reset the scroll
		    $(window).scrollTop(0)

7. Here comes the core part, transition. The transition is still controlled by canvas. During the control of the DOM visibility, we show the canvas animation and hide the canvas after the transition completed.

	{title="page-manager.coffee"}
		  pushSceneWithTransition: (scene, transitionClassName='TransitionAnimationB') ->
		  transition = new lib[transitionClassName]()

		  # The demension follows the Flash canvas dimension
		  transition.x = 300/2
		  transition.y = 400/2
		  $('#app-canvas').show()

		  transition.on 'sceneShouldChange', =>
		    @pushScene scene

		  transition.on 'transitionEnded', ->
		    $('#app-canvas').hide()

		  @stage.addChild transition

8. Let’s make use of the page transition. We change the `app.coffee` to the following code.

	{title="app.coffee"}
		# a global app object.
		this.exampleApp ?= {}

		# alias
		cjs = createjs
		setting = this.exampleApp.setting
		app = this.exampleApp

		class App
		  # Entry point.
		  constructor: ->
		    console.log "Welcome to my portfolio."

		    @canvas = document.getElementById("app-canvas")
		    @stage = new cjs.Stage(@canvas)

		    cjs.Ticker.setFPS 60
		    cjs.Ticker.addEventListener "tick", @stage # make sure the stage refresh drawing for every frame.

		    app.sceneManager = new app.PageManager(@stage)
		    app.sceneManager.resetWithScene $('.page:first')

		new App()

### What just happened?

We created the page transition manager that is very similar to our previous scene manager. The only difference is that page manager handles `.page` DOM element and scene manager handles CreateJS container.



### Improvement

We have reset the scroll position during scenes transition. In future, we may store the scroll position of each scene, so that we can resume the previous scroll position when popping to the last scene.






## 3. Positioning the canvas transition

### Time for Action

1. In the `retinalize.coffee` file, we add a `setFullScreen` function that scales the canvas to fit the window dimension.

	{title="retinalize.coffee"}
		# a global app object.
		this.exampleApp ?= {}

		setting = this.exampleApp.setting

		this.utility ?= {}

		this.utility.setFullScreen = (canvas, stage) ->
		  canvas.setAttribute 'width', $(window).width()
		  canvas.setAttribute 'height', $(window).height()
		  setting.width = $(window).width()
		  setting.height = $(window).height()

		  # 300 is the original Flash canvas width
		  stage.scaleX = stage.scaleY = setting.width / 300

2. In our app’s entry point, we invoke the `setFullScreen` function for the first time and register it to be run every time when the window resizes.

	{title="app.coffee"}
		class App
		  # Entry point.
		  constructor: ->
		    console.log "Welcome to my portfolio."

		    @canvas = document.getElementById("app-canvas")
		    @stage = new cjs.Stage(@canvas)

		    leanpub-start-insert
		    utility.setFullScreen(@canvas, @stage)

		    window.onresize = =>
		      utility.setFullScreen(@canvas, @stage)
		    leanpub-end-insert

		    ...

## 4. Falling back in old browser

### Time for Action

1. We add a new file `old-browser.js` to fall back the logic to basic HTML anchors navigation when the reader’s browser doesn’t support Canvas.

	{title="old-browser.js"}
		(function(){
		  // Check if canvas is supported
		  isCanvas2DSupported = !!window.CanvasRenderingContext2D;

		  // Give up all logic
		  if(!isCanvas2DSupported) {
		    // remove .page styles
		    $('.page').removeClass();
		  }
		}).call(this);

2. We include the `old-browser.js` file right after the loading of jQuery and before loading our logic.

	{title="index.html"}
		<script src="scripts/old-browser.js"></script>

### What’s happening?

We check if the browser supports the canvas. When the browser is too old to run canvas, we fall back to the step-1 which presents the content via browser hash link. This is done by removing all the `.page` class to force the scene transition and the `.page` styles not working.

## 5. Fine tuning the styles

### Time for Action

1. In the `app.css`, we add some more styles to make the app looks nice.

	{title="app.css"}
		#info-link {
		  position: fixed;
		  bottom: -5px;
		  left: 0;
		  width: 100%;
		}

		.header {
		  position: fixed;
		  top: 0;
		  left: 0;
		  width: 100%;
		}

		.non-collapse-content {
		  margin-top: 25%;
		}

		p {
		  padding: 1rem;
		}

		#main-list {
		  padding-bottom: 100px;
		}
		#main-list li {
		  margin-top: -11%;
		}

## 6. Supporting retina display

### Preparation

Make sure you have downloaded the new images assets that contain the `@2x` version of the images.

http://mak.la/cjs-proj1b-images.zip

### Time for Action

1. In the `index.html`, We add the `srcset` attribute for every `img` tag.

	{title="index.html"}
		<img src="images/header.png" srcset='images/header.png 1x, images/header@2x.png 2x' alt="Header">
		...
		<li><a href="#detail-page"><img src='images/a.png' srcset='images/a.png 1x, images/a@2x.png 2x' alt='Photo A'></a></li>
		<li><a href="#detail-page"><img src='images/b.png' srcset='images/b.png 1x, images/b@2x.png 2x' alt='Photo B'></a></li>
		<li><a href="#detail-page"><img src='images/c.png' srcset='images/c.png 1x, images/c@2x.png 2x' alt='Photo C'></a></li>
		...
		<img src='images/info.png' srcset='images/info.png 1x, images/info@2x.png 2x' alt='Link to Info'>
		...
		<img src='images/header-back.png' srcset='images/header-back.png 1x, images/header-back@2x.png 2x' alt='Back to main'>


### What’s happening?

`srcset` allows us to define separated images sources for different screen density.

Here is the syntax.

	<img src='DEFAULT_PATH' src='FILE_PATH 1x, FILE_PATH 2x, FILE_PATH 3x' alt=''>

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

{backmatter}

Thanks again for reading the book. Hope you enjoy the example projects and learn to build mobile app with the CreateJS library.

If you find any questions, you’re welcome to contact me for any questions.  You can find me at:

- Website: makzan.net
- Email: mak@makzan.net
- Twitter: @makzan

# Change Log

Version: 2015-01-09

The schedule of the book is a weekly release for new chapters. Then it will get edited and done in early 2015. The following is the change log of this book.



## Todos

- Add chapter 1b explanation.
- Add chapter 2 explanation.
- Split chapter 3 into steps.


## What have done

- 2015-01-09
	* Added project 4B summary.

- 2015-01-03
	* Added chapter 4B code example, which draws several different charts based on the same data in chapter 4.

- 2014-12-27
	* Added chapter 4 code example, which draws a interactive chart based on the user selection.

- 2014-12-13
	* Added chapter 3 code example, which demonstrated a solar system app with parallax effects.
	* Updated explanation in previous chapters.

- 2014-12-06
	* Added chapter 2 code example, which separates code into modules by the modal-view-controller pattern.

- 2014-11-22
	* Added chapter 1b example, which makes use of the Canvas transition in DOM-based application.

- 2014-11-07
	* Improved chapter 1 explanation.

- 2014-10-26
	* Added CreateJS introduction.
	* Organized the book content with front matters and 2 parts of content.
	* Added chapter 1 – basic app with animated transitions

- 2014-10-19
	* Added changes log to the book.

- 2014-10-18
	* Initial the book with pre-request section.
