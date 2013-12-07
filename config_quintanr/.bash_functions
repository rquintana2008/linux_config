# Define functions
function vw ()  
{
  vim `which $1`
}

function esg ()  
{
  env | grep -i -E ^$1=
}

function td ()
{
  echo ""
  echo "STARTING: tkdiff $1 $2 &"
  tkdiff $1 $2 &
  echo ""
}

function vf ()  
{
#  vim /net/easystreet/vol/dct1/designers/gregorys/dopplere/doc/flow.txt
#  vim /net/sunshine/vol/fortuna_1/designers/gregorys/fortuna_1/doc/flow.txt
  vim /net/sunshine/vol/fortuna_1/designers/quintanr/fortuna_1/flow.txt
}

function vd ()  
{
  vim /net/easystreet/vol/homes/gregorys/doc/flow/dev.txt

}

function post_check () {
    zfind $1 | grep $patokpassfail | header '#' $1 >> $db/BB.LOG
    if [[ -e post_${1}_stop ]]; then exit 0; fi
}


