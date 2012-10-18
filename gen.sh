echo 'corners...';
jruby -J-Xmx2056m create_corner_table.rb >heuristics/corners.csv;
echo 'edges_a...';
jruby -J-Xmx2056m create_edge_a_table.rb >heuristics/edges_a.csv;
echo 'edges_b...';
jruby -J-Xmx2056m create_edge_b_table.rb >heuristics/edges_b.csv;
echo 'done.';