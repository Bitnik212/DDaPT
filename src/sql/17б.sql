SELECT distinct exam_date, min(mark) FROM mydb.exam_marks
group by exam_date
order by min(mark) desc;