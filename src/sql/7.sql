SELECT distinct exam_date, count(mark) FROM mydb.exam_marks where mark > 2
group by exam_date;