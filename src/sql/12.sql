SELECT distinct s.kurs, count(distinct em.idsubject) FROM mydb.exam_marks as em
join mydb.student as s
on em.idstudent=s.idstudent
group by s.kurs;