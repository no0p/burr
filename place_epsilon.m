function s = place_epsilon(space, block)
  space{1, 2}(:, 2) += block(:, 3);
  space{1, 2}(:, 1) += block(:, 4);
  
  space{1, 3}(:, 2) += block(:, 2);
  space{1, 3}(:, 1) += block(:, 1);
  s = space;
endfunction
