require './lib/hashMap'

map = HashMap.new
map.set('name', 'Ahmed')
map.set('fame', 'Same')
map.set('Carlos', 'two')
map.set('Carla', 'three')
map.set('mame', 'lame')
map.set('kame', 'tame')
map.set('brought', 'one')
map.set('sure', 'one')
map.set('kreep', 'one')
map.set('peep', 'one')
map.set('sheep', 'one')
map.set('breep', 'one')
map.set('bork', 'bork one')
map.set('court', 'court one')
map.set('name', 'two')
puts "Current length is #{map.length}"
map.set('hello', 'bello')
map.set('fello', 'bello')
map.set('trello', 'bello')
map.set('rgwwerlo', 'bello')
map.set('hsdfsdfo', 'bello')
map.set('hdfsdfo', 'bello')
map.set('hdddfo', 'bello')
map.set('gggdfo', 'bello')
map.set('hteerefo', 'bello')
map.set('hdsdfsdfdsdfsdfsdfsfo', 'bello')
puts "Current length is #{map.length}"
map.set('hggggo', 'bello')
map.set('fggggo', 'bello')
map.set('tjuhrlo', 'bello')
map.set('rmklio', 'bello')
map.set('hlplplpo', 'bello')
map.set('htytytytytyto', 'bello')
map.set('hffffdsvho', 'bello')
map.set('syo', 'bello')
map.set('at', 'bello')
map.set('dvghtyuiopfsdfsdfsfo', 'bello')
puts "Current length is #{map.length}"
map.remove('name')
map.remove('court')
puts "After removing 2 now current length is #{map.length}"
map.clear
puts "And after clearing the hash now current length is #{map.length}"