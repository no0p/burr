function s = place_gamma(space, block)
  space{1, 1}(2, :) += block(:, 2)';
  space{1, 1}(3, :) += block(:, 3)';
  space{1, 2}(2, :) += block(:, 1)';
  space{1, 2}(3, :) += block(:, 4)';
  s = space;
endfunction
