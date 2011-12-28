fprintf("loading blocks\n");
load blocks.m;

fprintf("creating blank space...\n");


positions = {"alpha", "beta", "gamma", "delta", "epsilon", "phi"};

confs = 0; % Track total configurations

for i = 1:length(blocks)
  for j = 1:4
    alpha = shift(blocks{i, 2}', j)';
    
    for k = 1:length(blocks)
      for l = 1:4
        beta = shift(blocks{k, 2}', l)';
        
        for m = 1:length(blocks)
          for n = 1:4
            gamma = shift(blocks{m, 2}', n)';
            
            for o = 1:length(blocks)
              for p = 1:4
                delta = shift(blocks{o, 2}', p)';
                
                for q = 1:length(blocks)
                  for r = 1:4
                    epsilon = shift(blocks{q, 2}', r)';
                    
                    for s = 1:length(blocks)
                      for t = 1:4
                        phi = shift(blocks{s, 2}', t)';
                        
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
                        end
                        fflush(stdout);
                      endfor
                    endfor
                  endfor
                endfor
              endfor
            endfor
          endfor
        endfor
      endfor
    endfor
  endfor                
endfor

