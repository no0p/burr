function c = evaluate_space(space)
 
  fprintf("evaluating space");
  if sum(sum(space > 1)) == 0
    fprintf("solution");
  end

endfunction
