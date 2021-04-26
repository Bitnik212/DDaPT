SELECT subject_name, max(semester) FROM mydb.subject
group by subject_name;