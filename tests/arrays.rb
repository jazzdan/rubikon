def str
  [
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
end

strings = []
for i in 1..10000000
  strings[i] = str()
end