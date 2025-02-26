# Inspired by code from this the repository https://github.com/kNelakonda/list-examples-grader/blob/main/grade.sh
FSCORE=0
MAXSCORE=100

function score_message() {
    printf "Student recieved $1/$2 \n"
    
    exit 0
}

rm -rf student-submission

git clone $1 student-submission

echo 'Finished cloning'

cp TestListExamples.java ./student-submission/


if [ -f ./student-submission/ListExamples.java ]; then
    echo found
    FSCORE=$((FSCORE + 10))
else
    echo not found java file
    score_message $FSCORE $MAXSCORE
fi

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar student-submission/TestListExamples.java student-submission/ListExamples.java

if [[ $? -ne 0 ]]; then
    printf "Compiler did not work\n"
    score_message $FSCORE $MAXSCORE
fi

FSCORE=$((FSCORE + 20))

cd student-submission/

printf "_________running java now__________\n"

java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples >output.txt

if [[ $? -eq 0 ]]; then
    cat output.txt
    FSCORE=$((FSCORE + 70))
else
    cat output.txt
    t=$(grep -i "Tests run" output.txt)
    tests=$(echo $t | cut -d ' ' -f 3 | cut -d ',' -f 1)
    failed=$(echo $t | cut -d ' ' -f 5)

    echo $((tests - failed))/$tests tests passed

    FSCORE=$((FSCORE + 35 * (tests - failed)))

fi

score_message $FSCORE $MAXSCORE
