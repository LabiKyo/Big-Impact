{exec} = require 'child_process'
fs = require 'fs'

less = require 'less'
jade = require 'jade'
_ = require 'underscore'

# test
task 'test', 'run test', ->
  exec './node_modules/.bin/mocha
  --reporter spec
  --compilers coffee:coffee-script
  --require should
  --slow 75
  ./spec/*.coffee', (err, output) ->
    if err
      console.log err

# compile
task 'compile:less', 'compile less files', ->
  parser = new(less.Parser)(
    paths: ['./src/less', './vendor/less']
  )
  src = fs.readFileSync './src/less/main.less', 'utf-8'
  parser.parse src, (err, tree) ->
    if err
      console.log err
    else
      target = tree.toCSS(compress: true)
      fs.writeFileSync './build/css/main.css', target, 'utf-8'
      console.log 'compile:less success!'

task 'compile:coffee', 'compile coffee-scripts', ->
  exec 'coffee -b -j build/js/main.js -c
      src/coffee/main.coffee', (err, output) ->
    if err
      console.log err
    else
      console.log output, 'compile:coffee success!'

task 'compile:jade', 'compile jade to javascript function', ->
  template_dir = './src/jade/'
  options =
    compilerDebug: true
    client: true
  target = 'window.Template = {};\n'
  files = fs.readdirSync template_dir

  for file in files when /^.+\.jade$/.test file
    src = fs.readFileSync template_dir + file, 'utf-8'
    name = file[...file.indexOf '.']
    o = _.chain(options).clone().extend(filename: template_dir + file).value()
    fn = jade.compile src, o
    target += "window.Template.#{name} = #{fn.toString()};\n\n"

  fs.writeFileSync './build/js/templates.js', target, 'utf-8'

task 'compile', 'compile all', ->
  invoke 'compile:less'
  invoke 'compile:coffee'
  invoke 'compile:jade'

# watch
task 'watch', 'watch file changes and auto run tasks', ->
  invoke 'compile'
  coffee_watcher = fs.watch './src/coffee', (event, filename) ->
    #console.log event, filename
    invoke 'compile:coffee'

  less_watcher = fs.watch './src/less', (event, filename) ->
    #console.log event, filename
    invoke 'compile:less'

  jade_watcher = fs.watch './src/jade', (event, filename) ->
    #console.log event, filename
    invoke 'compile:jade'
