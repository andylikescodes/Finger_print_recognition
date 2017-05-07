function true = eliminatefalse(orig, false)
% A function to get rid of the false minutias
true = orig(~ismember(orig,false,'rows'),:);
