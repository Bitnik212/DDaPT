SELECT distinct exam_date, avg(mark) FROM mydb.exam_marks
group by exam_date
order by avg(mark) desc;