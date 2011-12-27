function s = place_alpha(space, block)
  for i = 1:size(block, 1)
    space{1, i}(1, 2:3) = block(i, 1:2);
    space{1, i}(2, 2:3) = fliplr(block(i, 3:4));
  endfor
  s = space;
endfunction
