gulp    = require 'gulp'
coffee  = require 'gulp-coffee'
concat  = require 'gulp-concat'

gulp.task 'js', ->
  gulp.src [
    'app/scripts-src/setting.coffee'
    'app/scripts-src/app.coffee'
  ]
  .pipe coffee()
  .pipe concat 'app.js'
  .pipe gulp.dest 'app/scripts/'


gulp.task 'watch', ->
  gulp.watch 'app/scripts-src/**/*.coffee', ['js']

gulp.task 'default', ['js', 'watch']


