{exec} = require 'child_process'
fs = require 'fs'

less = require 'less'
jade = require 'jade'
_ = require 'underscore'

# test
task 'feature', 'run cucumber features', ->
  exec 'cucumber.js', (err, output) ->
    if err
      console.log err
    else
      console.log output
###
task 'test', 'run test', ->
  exec './node_modules/.bin/mocha
  --reporter spec
  --compilers coffee:coffee-script
  --require should
  --slow 75
  ./spec/*.coffee', (err, output) ->
    if err
      console.log err
###

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
  files = [
    'view/layout',
    'view/navbar',
    'view/index',
    'view/admin',
    'view/activities',
    'view/profile',
    'model',
    'collection',
    'router',
    'sync',
    'main'
  ]
  script = 'coffee -bj build/js/main.js -c '
  for file in files
    script += "src/coffee/#{file}.coffee "
  exec script, (err, output) ->
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
  console.log 'compile:jade success!'

task 'compile', 'compile all', ->
  invoke 'compile:less'
  invoke 'compile:coffee'
  invoke 'compile:jade'

# watch
task 'watch', 'watch file changes and auto run tasks', ->
  invoke 'compile'
  invoke 'feature'
  fs.watch './src/coffee', (event, filename) ->
    invoke 'compile:coffee'
    invoke 'feature'

  fs.watch './src/coffee/view', (event, filename) ->
    invoke 'compile:coffee'
    invoke 'feature'

  fs.watch './src/less', (event, filename) ->
    invoke 'compile:less'
    invoke 'feature'

  fs.watch './src/jade', (event, filename) ->
    invoke 'compile:jade'
    invoke 'feature'

  fs.watch './features', ->
    invoke 'feature'

  fs.watch './features/support', ->
    invoke 'feature'

  fs.watch './features/step_definitions', ->
    invoke 'feature'
