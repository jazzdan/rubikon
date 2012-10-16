#!/usr/bin/ruby

require "awesome_print"

#target_pattern = [
  #[:r, :r, :r],
  #[:r, :r, :r],
  #[:g, :g, :g, :y, :y, :y, :b, :b, :b],
  #[:g, :g, :g, :y, :y, :y, :b, :b, :b],
  #[:g, :g, :g, :y, :y, :y, :b, :b, :b],
  #[:o, :o, :o],
  #[:o, :o, :o],
  #[:o, :o, :o],
  #[:w, :w, :w],
  #[:w, :w, :w],
  #[:w, :w, :w]
#]

target_pattern = [
  [
    [:r, :r, :r],
    [:r, :r, :r],
    [:r, :r, :r]
  ],

  [
    [:g, :g, :g],
    [:g, :g, :g],
    [:g, :g, :g]
  ],

  [
    [:y, :y, :y],
    [:y, :y, :y],
    [:y, :y, :y]
  ],

  [
    [:b, :b, :b],
    [:b, :b, :b],
    [:b, :b, :b]
  ],

  [
    [:o, :o, :o],
    [:o, :o, :o],
    [:o, :o, :o]
  ],

  [
    [:w, :w, :w],
    [:w, :w, :w],
    [:w, :w, :w]
  ]
]


if __FILE__ == $0
  puts "Starting mah script"
  ap(target_pattern)
end
