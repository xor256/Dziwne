#!/usr/bin/env ruby
# encoding: utf-8

require_relative './dziwne/Dziwne'
require 'test/unit'

# testy jednostkowe
class TestCExtPlama < Test::Unit::TestCase

 def test_tworzenie
  p = Dziwne.new
  assert_equal(Object, Dziwne.superclass)
  assert_equal(Dziwne, p.class)
  assert_equal( 'Dziwne', p.cosik )
 end

end
