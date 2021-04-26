SELECT distinct idstudent, max(mark) FROM mydb.exam_marks
group by idstudent;