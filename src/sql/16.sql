SELECT distinct exam_date, idstudent, sum(mark) FROM mydb.exam_marks
group by exam_date, idstudent
order by sum(mark) desc;