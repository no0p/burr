function c = evaluate_space(space)
  c = 0;
  fprintf("evaluating space");
  for i = 1:length(space)
    if sum(sum(space{1, i} > 1)) == 0
      fprintf("solution");
      c = 1
    end
  end
endfunction
