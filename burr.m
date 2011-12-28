function burr(first_block = 1)
  fprintf("loading blocks\n");
  load blocks.m;

  fprintf("creating blank space...\n");
  positions = {"alpha", "beta", "gamma", "delta", "epsilon", "phi"};

  confs = 0; % Track total configurations
  for i = first_block:length(blocks)
    fas = {blocks{i, 2}, flip(blocks{i, 2})};
    for z = 1:length(fas)
      for j = 0:3
        alpha = shift(fas{z}', j)';
        for k = 1:length(blocks)
          if k != i
            fbs = {blocks{k, 2}, flip(blocks{k, 2})};
            for y = 1:length(fbs)
              for l = 0:3
                beta = shift(fbs{y}', l)';
                for m = 1:length(blocks)
                  if m != k && m != i
                    fcs = {blocks{m, 2}, flip(blocks{m, 2})};
                    for x = 1:length(fcs)
                      for n = 0:3
                        gamma = shift(fcs{y}', n)';
                        for o = 1:length(blocks)
                          if o != k && o != m && o != i
                            fds = {blocks{o, 2}, flip(blocks{o, 2})};
                            for w = 1:length(fds)
                              for p = 0:3
                                delta = shift(fds{w}', p)';
                                for q = 1:length(blocks)
                                  if q != o && q != k && q != m && q != i
                                    fes = {blocks{q, 2}, flip(blocks{q, 2})};
                                    for v = 1:length(fes)
                                      for r = 0:3
                                        epsilon = shift(fes{v}', r)';
                                        for s = 1:length(blocks)
                                          if s != q && s != o && s != k && s != m && s != i
                                            ffs = {blocks{s, 2}, flip(blocks{s, 2})};
                                            for u = 1:length(ffs)
                                              for t = 0:3
                                                phi = shift(ffs{u}', t)';
                                                
                                                space = block_space(4);
                                                space = place_alpha(space, alpha);
                                                space = place_beta(space, beta);
                                                space = place_gamma(space, gamma);
                                                space = place_delta(space, delta);
                                                space = place_epsilon(space, epsilon);
                                                space = place_phi(space, phi);
                                                
                                                confs += 1;
                                                fprintf("%d\n", confs);
                               
                                                
                                                if evaluate_space(space) == 1
                                                  fprintf("found match ... ");
                                                  fprintf("i: %d\nj: %d\n k: %d\n l: %d\n m: %d\n n: %d\n o: %d\n p: %d\n q: %d\n r: %d\n s: %d\n t: %d\n", i, j, k, l, m, n, o, p, q, r, s, t);
                                                  error
                                                end
                                                fflush(stdout);
                                              endfor
                                            endfor
                                          endif
                                        endfor
                                      endfor
                                    endfor
                                  endif
                                endfor
                              endfor
                            endfor
                          endif
                        endfor
                      endfor
                    endfor
                  endif
                endfor
              endfor
            endfor
          endif  
        endfor
      endfor
    endfor
  endfor
endfunction

