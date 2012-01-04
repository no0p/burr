function burr(first_block = 1, explode = 0)
  fprintf("loading blocks\n");
  load blocks.m;

  positions = {"alpha", "beta", "gamma", "delta", "epsilon", "phi"};

  confs = 0; % Track total configurations

  for i = first_block:length(blocks)
    fas = {blocks{i, 2}, flip(blocks{i, 2})};
    for z = 1:length(fas)
      for j = 0:3
        alpha = shift(fas{z}', j)';
        litmus_a = place_alpha(block_space(4), alpha);
        for k = 1:length(blocks)
          if k != i
            fbs = {blocks{k, 2}, flip(blocks{k, 2})};
            for y = 1:length(fbs)
              for l = 0:3
                beta = shift(fbs{y}', l)';
                litmus_b = place_beta(litmus_a, beta);
                if evaluate_space(litmus_b) == 0
                  continue;
                endif
                for m = 1:length(blocks)
                  if m != k && m != i
                    fcs = {blocks{m, 2}, flip(blocks{m, 2})};
                    for x = 1:length(fcs)
                      for n = 0:3
                        gamma = shift(fcs{y}', n)';
                        litmus_c = place_gamma(litmus_b, gamma);
                        if evaluate_space(litmus_c) == 0
                          continue;
                        endif
                        for o = 1:length(blocks)
                          if o != k && o != m && o != i
                            fds = {blocks{o, 2}, flip(blocks{o, 2})};
                            for w = 1:length(fds)
                              for p = 0:3
                                delta = shift(fds{w}', p)';
                                litmus_d = place_delta(litmus_c, delta);
                                if evaluate_space(litmus_d) == 0
                                  continue;
                                endif
                                for q = 1:length(blocks)
                                  if q != o && q != k && q != m && q != i
                                    fes = {blocks{q, 2}, flip(blocks{q, 2})};
                                    for v = 1:length(fes)
                                      for r = 0:3
                                        epsilon = shift(fes{v}', r)';
                                        litmus_e = place_epsilon(litmus_d, epsilon);
                                        if evaluate_space(litmus_e) == 0
                                          continue;
                                        endif
                                        for s = 1:length(blocks)
                                          if s != q && s != o && s != k && s != m && s != i
                                            ffs = {blocks{s, 2}, flip(blocks{s, 2})};
                                            for u = 1:length(ffs)
                                              for t = 0:3
                                                phi = shift(ffs{u}', t)';
                                                
                                                space = place_phi(litmus_e, phi);
                                                %confs += 1;
                                                %if mod(confs, 1000) == 0
                                                %  fprintf("%d:%d:%d:%d:%d:%d\n", i, k, m, o, q, s);
                                                %  fflush(stdout);
                                                %end
                                                
                                                if evaluate_space(space) == 1
                                                  fprintf(" *********** found match ************ ");
                                                  fprintf("alpha: %d  rotate: %d  flip: %d\n beta: %d rotate: %d flip: %d\n gamma: %d rotate: %d flip: %d\n delta: %d rotate: %d flip: %d\n epsilon: %d rotate: %d flip: %d\n phi: %d rotate: %d flip: %d\n\n", i, j, z, k, l, y, m, n, x, o, p, w, q, r, v, s, t, u);
                                                  
                                                  fflush(stdout);
                                                  if explode == 1
                                                    error
                                                  end

                                                end
                                                
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

