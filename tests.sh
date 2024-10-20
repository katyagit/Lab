expected_output="./lab.sh"
    if [ ! -f "$expected_output" ]; then
       echo "First test failed :("
       echo "The file does not exist"
     else
       echo "First test passed!"
       bash "$1" "$2" "$3"
       res=$(bash "$1" "$2" "$3")
    if [ -z "$2" ]; then
       echo "Second test failed"
       echo "No path provided"
     else
       echo "Second test passed"
     fi
     if [ -z "$3" ]; then
        echo "Third test failed!"
        echo "No argument provided"
      else
        echo "Third test passed"
      fi

      if [[ $res =~ ^[0-9]+ ]]; then
         echo "Fourth test passed"
      else
        echo "Fourth failed"
       echo "No percentage shown"
      fi
   fi