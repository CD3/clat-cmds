#! /usr/bin/env bats

load utils

@test "simple tests with fileinput" {

cat << EOF > tmp.txt
1 1 1
2 2 3
3 4 4
EOF

run ../src/avg tmp.txt
Close "$( echo $output | cut -d ' ' -f 1 )" "2.0"
Close "$( echo $output | cut -d ' ' -f 2 )" "2.33333333"
Close "$( echo $output | cut -d ' ' -f 3 )" "2.66666666"

run ../src/sum tmp.txt
Close "$( echo $output | cut -d ' ' -f 1 )" "6.0"
Close "$( echo $output | cut -d ' ' -f 2 )" "7.0"
Close "$( echo $output | cut -d ' ' -f 3 )" "8.0"

run ../src/stddev tmp.txt
Close "$( echo $output | cut -d ' ' -f 1 )" "1.0"
Close "$( echo $output | cut -d ' ' -f 2 )" "1.527525"
Close "$( echo $output | cut -d ' ' -f 3 )" "1.527525"

run ../src/stddev -b tmp.txt
Close "$( echo $output | cut -d ' ' -f 1 )" "1.0*sqrt(3-1)/sqrt(3)"
Close "$( echo $output | cut -d ' ' -f 2 )" "1.527525*sqrt(3-1)/sqrt(3)"
Close "$( echo $output | cut -d ' ' -f 3 )" "1.527525*sqrt(3-1)/sqrt(3)"

run ../src/unc tmp.txt
Close "$( echo $output | cut -d ' ' -f 1 )" "1.0/sqrt(3)"
Close "$( echo $output | cut -d ' ' -f 2 )" "1.527525/sqrt(3)"
Close "$( echo $output | cut -d ' ' -f 3 )" "1.527525/sqrt(3)"

rm tmp.txt

}

@test "simple tests with stdinput" {

cat << EOF > tmp.txt
1 1 1
2 2 3
3 4 4
EOF

output=$(cat tmp.txt | ../src/avg)
Close "$( echo $output | cut -d ' ' -f 1 )" "2.0"
Close "$( echo $output | cut -d ' ' -f 2 )" "2.33333333"
Close "$( echo $output | cut -d ' ' -f 3 )" "2.66666666"

output=$(cat tmp.txt | ../src/sum)
Close "$( echo $output | cut -d ' ' -f 1 )" "6.0"
Close "$( echo $output | cut -d ' ' -f 2 )" "7.0"
Close "$( echo $output | cut -d ' ' -f 3 )" "8.0"

output=$(cat tmp.txt | ../src/stddev)
Close "$( echo $output | cut -d ' ' -f 1 )" "1.0"
Close "$( echo $output | cut -d ' ' -f 2 )" "1.527525"
Close "$( echo $output | cut -d ' ' -f 3 )" "1.527525"

output=$(cat tmp.txt | ../src/stddev -b)
Close "$( echo $output | cut -d ' ' -f 1 )" "1.0*sqrt(3-1)/sqrt(3)"
Close "$( echo $output | cut -d ' ' -f 2 )" "1.527525*sqrt(3-1)/sqrt(3)"
Close "$( echo $output | cut -d ' ' -f 3 )" "1.527525*sqrt(3-1)/sqrt(3)"

output=$(cat tmp.txt | ../src/unc)
Close "$( echo $output | cut -d ' ' -f 1 )" "1.0/sqrt(3)"
Close "$( echo $output | cut -d ' ' -f 2 )" "1.527525/sqrt(3)"
Close "$( echo $output | cut -d ' ' -f 3 )" "1.527525/sqrt(3)"

rm tmp.txt

}
