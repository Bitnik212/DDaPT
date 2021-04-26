SELECT idstudent, min(mark) FROM mydb.exam_marks
group by idstudent;