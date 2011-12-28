function s = place_gamma(space, block)
  space{1, 3}(2, :) = block(:, 2);
  space{1, 3}(3, :) = block(:, 3);
  space{1, 4}(2, :) = block(:, 1);
  space{1, 4}(3, :) = block(:, 4);
  s = space;
endfunction
