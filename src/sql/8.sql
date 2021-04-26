SELECT distinct s.kurs, em.idsubject, avg(em.mark)  FROM mydb.exam_marks as em
join mydb.student as s
on em.idstudent=s.idstudent
group by s.kurs, em.idsubject;