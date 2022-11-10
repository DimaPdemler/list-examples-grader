# Create your grading script here

set -e

CPATH=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"








rm -rf student-submission
git clone $1 student-submission



cp TestListExamples.java  ./student-submission/
ls student-submission/
if [ -e "student-submission/ListExamples.java" ]
then 
   echo found
else
    echo not found
    exit

fi

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar student-submission/TestListExamples.java student-submission/ListExamples.java

cd  student-submission/



java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples









