SELECT CASE 
WHEN COUNT(num) = 1 THEN num ELSE null END as num
FROM MyNumbers
group by num
order by num desc
limit 1;
