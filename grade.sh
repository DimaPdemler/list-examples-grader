# Create your grading script here

FSCORE=0
MAXSCORE=100

# This was inspired by the repository I peer reviewed. Its link is: https://github.com/kNelakonda/list-examples-grader
function score_message(){
    printf "Student recieved $1/$2 \n"
    exit 0
}


set -e

CPATH=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"






rm -rf student-submission
git clone $1 student-submission



cp TestListExamples.java  ./student-submission/
cp ListExamples.java  ./student-submission/

ls student-submission/
if [ -e "student-submission/ListExamples.java" ]
then 
   echo found
   FSCORE=$((FSCORE + 10))
else
    echo not found
    exit

fi

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar student-submission/TestListExamples.java student-submission/ListExamples.java 

# java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > output1.txt



printf "\n---Running Java files now---\n"
if [[ $? -ne 0 ]]
then
    score_message $FSCORE $MAXSCORE
fi

FSCORE=$((FSCORE + 10))



cd  student-submission/



java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples | tee -a output.txt


if [[ $? -eq 0 ]]
then
    FSCORE=$((FSCORE + 80))

else

    t=$(grep -i "Tests run" output.txt)
	tests=$(echo $t | cut -d ' ' -f 3 | cut -d ',' -f 1)
	failed=$(echo $t | cut -d ' ' -f 5)

    echo $((tests - failed))/$tests tests passed

	FSCORE=$((FSCORE + 15*(tests - failed)))

fi


score_message $FSCORE $MAXSCORE











