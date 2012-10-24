echo 'corners...';
jruby -J-Xmx2056m create_corner_table.rb >heuristics/corners.csv;
echo 'edges...';
jruby -J-Xmx2056m create_edge_table.rb >heuristics/edges.csv;
echo 'done.';