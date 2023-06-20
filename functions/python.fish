function python --description "Run ipython if python is called without arguments and ipython is install in virtual env"
  if count $argv > /dev/null; or not command -sq ipython
    command python $argv
  else
    command ipython
  end
end
