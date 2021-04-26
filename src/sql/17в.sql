SELECT distinct exam_date, max(mark) FROM mydb.exam_marks
group by exam_date
order by max(mark) desc;