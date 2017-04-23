function Close
{
  local a=$(echo "$1" | bc -l); shift
  local b=$(echo "$1" | bc -l); shift
  local tol=${1:-0.01}

  # relative error: (a - b)
  #                 -------
  #                 (a + b)
  #                   --
  #                   2
  # check that relative error is less than tolerance

  # NOTE: bash functions should return 0 for "good" and !0 for "bad"
  if (( $( echo "2*sqrt(($a-$b)^2) <= $tol*(sqrt($a^2) + sqrt($b^2))" | bc -l ) ))
  then
    return 0
  else
    err=$( echo "2*sqrt(($a-$b)^2)/(sqrt($a^2) + sqrt($b^2))" | bc -l )
    echo "Relative error for '$a' and '$b' ($err) exceeds the tolerance ($tol)."
    return 1
  fi

}

function Same
{
  local a=$1; shift
  local b=$1; shift

  if [[ $a == $b ]]
  then
    return 0
  else
    echo "'$a' and '$b' are not the same."
    return 1
  fi
}
