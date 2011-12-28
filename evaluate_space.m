function c = evaluate_space(space)
  c = 0;
  fprintf("evaluating space");
  
  summa = 0
  for i = 1:length(space)
    summa += sum(sum(space{1, i} > 1))
  end
  
  if summa == 0
    fprintf("solution");
    c = 1;
  end
  
endfunction
