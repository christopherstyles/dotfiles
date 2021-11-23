function current-branch
  # git branch | grep \* | cut -d ' ' -f2
  #
  # As of git 2.22.0, we can do...
  git branch --show-current
end
