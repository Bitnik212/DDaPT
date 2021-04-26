SELECT  distinct em.idstudent , avg(em.mark)  FROM mydb.exam_marks as em
group by em.idstudent;