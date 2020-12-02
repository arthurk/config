# Defined in - @ line 1
function hr --wraps='history --merge' --wraps='history merge' --description 'alias hr history merge'
  history merge $argv;
end
