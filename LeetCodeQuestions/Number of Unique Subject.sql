SELECT t1.teacher_id , count(DISTINCT(t2.subject_id)) as cnt
FROM Teacher t1 JOIN Teacher t2
ON t1.teacher_id = t2.teacher_id
group by t1.teacher_id;
