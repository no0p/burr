function newblock = flip(block)
  newblock(:, 1) = block(:, 2);
  newblock(:, 2) = block(:, 1);
  newblock(:, 3) = block(:, 4);
  newblock(:, 4) = block(:, 3);
end
