function s = place_phi(space, block)
  space{1, 2}(:, 4) += block(:, 3);
  space{1, 2}(:, 3) += block(:, 4);
  
  space{1, 3}(:, 4) += block(:, 2);
  space{1, 3}(:, 3) += block(:, 1);
  s = space;
endfunction
