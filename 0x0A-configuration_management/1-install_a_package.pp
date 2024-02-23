# installing flask package using pip3
node default {
package {'Flask':
ensure   => '2.1.0',
provider => 'pip3'
}
}
